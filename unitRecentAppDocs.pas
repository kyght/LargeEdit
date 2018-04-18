unit unitRecentAppDocs;

interface

uses classes;

  function LoadRecentDocs( List: TStringList; filename: string = '' ): boolean;
  procedure AddRecentDocs( List: TStringList; Doc: String; filename: string = '');

implementation

uses sysutils, forms;

const scRecentFile = 'recent.lst';

function GetRecentFileName( filename: string = '' ): String;
begin
  if (length(filename) <= 0) then
    result := ExtractFilePath(Application.Exename) + scRecentfile
  else
    result := ExtractFilePath(Application.Exename) + filename;
end;

function LoadRecentDocs( List: TStringList; filename: string = '' ): boolean;
var
  fnme: String;
begin
  fnme := GetRecentFileName( filename );
  if FileExists(fnme) then begin
    List.LoadFromFile(fnme);
  end;
  result := true;
end;

procedure AddRecentDocs( List: TStringList; Doc: String; filename: string = '' );
var
  fnme: String;
begin
  fnme := GetRecentFileName(filename);
  if list.IndexOf(Doc) >= 0 then begin
    list.Move(list.IndexOf(Doc), 0);
  end
  else if list.count >= 10 then begin
    list.Delete(list.count - 1);
    list.Insert(0, doc);
  end
  else
    list.Insert(0, doc);
  list.SaveToFile(fnme);
end;

end.
