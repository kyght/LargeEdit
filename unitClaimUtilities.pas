unit unitClaimUtilities;

interface

uses db, forms, sysutils, stdctrls, classes,
    compDSIDateTimePicker, comctrls, dbclient, dbgrids;

type
  TSearchByMethod = function(Value: String): TDataSet of object;
  PMethodMapItem = ^TMethodMapItem;
  TMethodMapItem = record
    name:           String;
    method:         TSearchByMethod;
    end;


function  SelectFromMulti(var DataSet: TDataSet; SM: TSearchByMethod): boolean;
procedure DataToForm(Data: TDataset; Form: TForm);

procedure FormToData(Data: TDataset; Form: TForm; Action: String);
procedure FormToDataSet(Data: TDataset; Form: TForm);

procedure DataLookupToForm(Data: TDataSet; Form: TForm; Key, Desname: String);
procedure DataListToForm(Data: TDataset; Form: TForm; Key: String);
procedure DataSrcToForm(Data: TDataSet; Form: TForm);

procedure ClearForm(Form: TForm);
function  GetCustomOraError(Err: String): String;

procedure DelAllIndexes( cds: TClientDataset);
procedure OrderDBGridColumns( cds: TClientDataset; col: TColumn );
procedure ResizeGridCols( ds: Tdataset; Cols: TDBGridColumns);

function RoundFloat(Value: double; Percision: Integer): double;

function GetTotalAmount(dataset: TDataSet; Field: String): double;
function GetDistinctCount(dataset: TDataSet; Field: String): integer;
procedure GetDateRangeInfo(dataset: TDataSet; Field: String; var Low, High: TDateTime);

implementation

uses dialogRowSelect, dbctrls, checklst, dialogs, math;

function SelectFromMulti(var DataSet: TDataSet;
  SM: TSearchByMethod): boolean;
var
  dlg: TdlgRowSelect;
begin
  dlg := TdlgRowSelect.Create(nil, DataSet, SM);
  try
    if dlg.Execute then begin
      DataSet := dlg.Data;
      result := true;
      end
    else
      result := false
  finally
    dlg.Free;
  end;
end;

procedure DataToForm(Data: TDataset; Form: TForm);
var
  i,j,k: Integer;
  cname, dbindname: String;
begin
  for i := 0  to data.FieldCount - 1 do begin
    dbindname := lowercase(data.Name + data.Fields[i].FieldName);
    for j := 0 to form.ComponentCount - 1 do begin
      cname := lowercase(form.Components[j].Name);
      if pos(dbindname, cname) <= 0 then continue;
      //matching component found now display in components
      if form.Components[j] is TEdit then begin
        with form.Components[j] as TEdit do begin
          if Tag = 3 then
            Text := data.Fields[i].DisplayText
          else
            Text := data.Fields[i].AsString;
          end;
        end
      else if form.Components[j] is TMemo then
        with form.Components[j] as TMemo do
          lines.Text := data.Fields[i].AsString
      else if form.Components[j] is TDSIDateTimePicker then begin
        with form.Components[j] as TDSIDateTimePicker do begin
          if Length(data.Fields[i].AsString) <= 0 then
            Checked := false
          else begin
            Checked := true;
            DateTime := data.Fields[i].AsDateTime;
            end
          end;
        end
      else if form.Components[j] is TDateTimePicker then
        with form.Components[j] as TDateTimePicker do
          DateTime := data.Fields[i].AsDateTime
      else if form.Components[j] is TComboBox then
        with form.Components[j] as TComboBox do begin
          for k := 0 to items.Count -  1 do begin
            if Integer(items.Objects[k]) = data.Fields[i].AsInteger then
              itemindex := k;
          end;
        end
    end;
  end;
end;

procedure FormToData(Data: TDataset; Form: TForm; Action: String);
var
  i,j: Integer;
  cname, dbindname, vle: String;
begin
  if action = 'insert' then data.Insert
  else if action = 'update' then data.Edit;
  for i := 0  to data.FieldCount - 1 do begin
    dbindname := lowercase(data.Name + data.Fields[i].FieldName);
    for j := 0 to form.ComponentCount - 1 do begin
      cname := lowercase(form.Components[j].Name);
      if pos(dbindname, cname) <= 0 then continue;
      //matching component found now display in components
      if form.Components[j] is TEdit then
        with form.Components[j] as TEdit do
          if (data.Fields[i].Required) and (length(text) <= 0) then
            data.Fields[i].AsString := data.Fields[i].AsString
          else begin
              vle := text;
              if tag = 3 then begin
                vle := StringReplace(vle,'$','', [rfReplaceAll,rfIgnoreCase]);
                vle := StringReplace(vle,',','', [rfReplaceAll,rfIgnoreCase]);
                data.Fields[i].AsString := vle;
                end
              else
                data.Fields[i].AsString := text;
            end
      else if form.Components[j] is TMemo then
        with form.Components[j] as TMemo do
          if (data.Fields[i].Required) and (length(lines.text) <= 0) then
            data.Fields[i].AsString := data.Fields[i].AsString
          else
            data.Fields[i].AsString := lines.Text
      else if form.Components[j] is TDSIDateTimePicker then begin
        with form.Components[j] as TDSIDateTimePicker do begin
          if Checked then
            data.Fields[i].AsDateTime := DateTime
          else
            data.Fields[i].AsString := '';
        end
      end
      else if form.Components[j] is TDateTimePicker then
        with form.Components[j] as TDateTimePicker do
          data.Fields[i].AsDateTime := DateTime
      else if form.Components[j] is TComboBox then
        with form.Components[j] as TComboBox do begin
          if itemIndex <> -1 then
            data.Fields[i].AsInteger := Integer(items.objects[itemindex])
          else
            data.Fields[i].AsString := '';
          if length(text) <= 0 then
            data.Fields[i].AsString := '';
        end
    end;
//    showmessage(data.Fields[i].FieldName+' = '+data.Fields[i].AsString);
  end;
  data.Post;
end;

procedure FormToDataSet(Data: TDataset; Form: TForm);
begin
  with data do begin
    if data.State in [dsinsert, dsedit] then
      Post;
    First;
    while not eof do begin
      FormToData(Data, form, 'update');
      Next;
    end;
  end;
end;

procedure DataSrcToForm(Data: TDataSet; Form: TForm);
var
  j: Integer;
  cname, dbindname: String;
begin
  dbindname := lowercase(data.Name);
  for j := 0 to form.ComponentCount - 1 do begin
      cname := lowercase(form.Components[j].Name);
      if pos(dbindname, cname) <= 0 then continue;
      //matching component found bind to datasource
      if form.Components[j] is TDataSource then
        with form.Components[j] as TDataSource do
          DataSet := Data;
  end;
end;

procedure ClearForm(Form: TForm);
var
  j: Integer;
begin
  for j := 0 to form.ComponentCount - 1 do begin
      if form.Components[j] is TComponent then
        with form.Components[j] as TComponent do
          if tag = 1 then continue;

      if form.Components[j] is TLabel then
        with form.Components[j] as TLabel do
          if tag = 2 then Caption := '';

      if form.Components[j] is TDataSource then
        with form.Components[j] as TDataSource do
          DataSet := nil
      else if form.Components[j] is TEdit then
        with form.Components[j] as TEdit do
          Text := ''
      else if form.Components[j] is TMemo then
        with form.Components[j] as TMemo do
          lines.text := ''
      else if form.Components[j] is TDateTimePicker then
        with form.Components[j] as TDateTimePicker do
          datetime := now
      else if form.Components[j] is TDSIDateTimePicker then
        with form.Components[j] as TDSIDateTimePicker do
          datetime := now
      else if form.Components[j] is TCheckListBox then
        with form.Components[j] as TCheckListBox do
          items.Clear
      else if form.Components[j] is TComboBox then
        with form.Components[j] as TComboBox do begin
          text := '';
          itemIndex := -1;
        end;
  end;
end;

procedure DataListToForm(Data: TDataset; Form: TForm; Key: String);
var
  i,j, id: Integer;
  cname, dbindname: String;
begin
  dbindname := lowercase(data.name);
  for j := 0 to form.ComponentCount - 1 do begin
      cname := lowercase(form.Components[j].Name);
      if pos(dbindname, cname) <= 0 then continue;
      //matching component found bind to datasource
      if form.Components[j] is TCheckListBox then begin
        with form.Components[j] as TCheckListBox do begin
          data.First;
          while not data.Eof do begin
            if assigned(data.FindField(Key)) then begin
              id := data.FieldByName(Key).AsInteger;
              for i := 0 to items.Count - 1 do begin
                if Integer(items.Objects[i]) = id then
                  checked[i] := true;
              end;
            end;
            data.Next;
          end;
        end;
      end;
  end;
end;

procedure DataLookupToForm(Data: TDataSet; Form: TForm; Key, Desname: String);
var
  j, id: Integer;
  cname, dbindname, des: String;
begin
  dbindname := lowercase(data.Name);
  for j := 0 to form.ComponentCount - 1 do begin
      cname := lowercase(form.Components[j].Name);
      if pos(dbindname, cname) <= 0 then continue;
      //matching component found bind to datasource
      if form.Components[j] is TComboBox then
        with form.Components[j] as TComboBox do begin
          items.Clear;
          data.First;
          while not data.Eof do begin
            if assigned(data.FindField(Desname)) then
              des := data.FieldByName(Desname).AsString;
            if assigned(data.FindField(Key)) then begin
              id := data.FieldByName(Key).AsInteger;
              items.AddObject(des, TObject(id));
            end;  
            data.Next;
          end;
          itemIndex := -1;
        end
      else if form.Components[j] is TCheckListBox then begin
        with form.Components[j] as TCheckListBox do begin
          items.Clear;
          data.First;
          while not data.Eof do begin
            if assigned(data.FindField(Desname)) then
              des := data.FieldByName(Desname).AsString;
            if assigned(data.FindField(Key)) then begin
              id := data.FieldByName(Key).AsInteger;
              items.AddObject(des, TObject(id));
            end;  
            data.Next;
          end;
        end;
      end;
  end;
end;

function GetCustomOraError(Err: String): String;
var
  i: integer;
  e: String;
begin
  //ORA-20001: Worker sadfasdf is not a valid user.
  result := '';
  i := pos('ORA-20001:',Err);
  if i <= 0 then exit;
  e := Copy(Err, i+10, length(err));
  i := pos('.', e);
  if i <= 0 then exit;
  e := Copy(e, 0, i);
  result := e;
end;

procedure OrderDBGridColumns( cds: TClientDataset; col: TColumn );
var
  idxopt: TIndexOptions;
  idxnme: String;
begin
  with cds do
    if Active then
      begin
        idxopt := [ixCaseInsensitive];
        idxnme := col.Field.FieldName + 'INDEX';
        if IndexName = idxnme+'ASC' then begin
          idxopt := idxopt + [ixDescending];
          idxnme := idxnme + 'DESC';
          end
        else
          idxnme := idxnme+'ASC';
        DelAllIndexes(cds);
        AddIndex( idxnme, col.Field.FieldName, idxopt,'','',0);
        IndexName := idxnme;
        IndexDefs.Update;
      end;
end;

procedure DelAllIndexes( cds: TClientDataset);
var
  indexlist: TStrings;
  i: integer;
begin
  indexlist := TStringList.Create;

  with cds do begin
    if Active then
      GetIndexNames( indexlist );
    IndexName := 'DEFAULT_ORDER';
  end;

  with indexlist do
    if Count > 0 then
      for i := 0 to Count - 1 do
        if (( Strings[i] <> 'DEFAULT_ORDER' )
          and ( Strings[i] <> 'CHANGEINDEX' )) then
            cds.DeleteIndex( Strings[i] );

  indexlist.Free;
end;

function RoundFloat(Value: double; Percision: Integer): double;
var
  multi: double;
begin
  multi := IntPower(10, percision);
  result := (round(value*multi)/multi);
end;

procedure ResizeGridCols( ds: Tdataset; Cols: TDBGridColumns);
var
  i: integer;
  fld: String;
  size: integer;
begin
  with ds do begin
    DisableControls;
    First;
    for i := 0 to cols.Count - 1 do begin
      fld := cols.Items[i].DisplayName;
      size := Length(fld) * cols.Items[i].Font.Size;
      cols.Items[i].Width := size;
    end;
    for i := 0 to cols.Count - 1 do begin
      First;
      while not eof do begin
        if not assigned(cols.Items[i].Field) then break;
        fld := cols.Items[i].Field.AsString;
        size := Length(fld) * cols.Items[i].Font.Size;
        if cols.Items[i].Width < size then cols.Items[i].Width := size;
        next;
      end;
    end;
    First;
    EnableControls;
  end;
end;

function GetTotalAmount(dataset: TDataSet; Field: String): double;
var
  total, value: double;
begin
  if not assigned(dataset) then exit;
  if not assigned(dataset.FindField(Field)) then exit;
  total := 0;
  with dataset do begin
    disablecontrols;
    first;
    while not eof do begin
      value := FieldByName(Field).AsFloat;
      total := total + value;
      next;
      end;
    first;
    enablecontrols;
  end;
  result := total; //RoundFloat(total, 2);
end;

function GetDistinctCount(dataset: TDataSet;
  Field: String): integer;
var
  lst: TStringList;
begin
  if not assigned(dataset) then exit;
  if not assigned(dataset.FindField(Field)) then exit;
  lst := TStringList.Create;
  try
    lst.Sorted := true;
    with dataSet do begin
      disablecontrols;
      first;
      while not eof do begin
        lst.Add(FieldByName(Field).AsString);
        next;
        end;
      first;
      enablecontrols;
    end;
    result := lst.Count;
  finally
    lst.Free;
  end;
end;

procedure GetDateRangeInfo(dataset: TDataSet; Field: String; var Low, High: TDateTime);
var
  plow, phigh, pcur: TDatetime;
begin
  if not assigned(dataset) then exit;
  if not assigned(dataset.FindField(Field)) then exit;
  with dataSet do begin
    disablecontrols;
    first;
    plow := FieldByName(FIELD).AsDatetime;
    phigh := FieldByName(FIELD).AsDatetime;
    while not eof do begin
      pcur := FieldByName(FIELD).AsDatetime;
      if pcur < plow then plow := pcur;
      if pcur > phigh then phigh := pcur;
      next;
      end;
    first;
    enablecontrols;
  end;
  Low := plow;
  High := phigh;
end;



end.
