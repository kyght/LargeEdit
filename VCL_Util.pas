unit VCL_Util;

interface

Uses
  Classes, TypInfo, Graphics, Grids, dbGrids;

Type
  TStringObj = Class (TObject)
    i : Integer;
    iCurr : Currency;
    Constructor Create (Const aString : String); Overload;
    Constructor Create (Const aString : String; ai : Integer); Overload;
    Constructor Create (Const aString : String; aiCurr : Currency); Overload;
    Constructor Create (Const aString1, aString2 : String); Overload;
    Constructor Create (Const aString1, aString2 : String; ai : Integer); Overload;
    Constructor Create (aStrings : Array of String); Overload;
    Destructor Destroy; OverRide;
  private
    sList : TStringList;
    Function GetS : String;
    Function GetS2 : String;
    Function GetStrings (Index : Integer) : String;
    Procedure SetStrings (Index : Integer; NewValue : String);
  public
    Property S : String  Read GetS;
    Property S2 : String  Read GetS2;
    Property Strings[Index : Integer] : String  Read GetStrings  Write SetStrings;
    Procedure AddString (Const aString : String);
    Function StringCount : Integer;
  End;

  TGridColDesc = Record
    FldName : String;
    Alignmt : TAlignment;
    ColCapt : String;
    CaptAlign : TAlignment;
    MinWidth : Integer;
    VarWidth : Integer
  End;

Function GridColsMinWidth (ColDescs : Array of TGridColDesc) : Integer;
Function GetGridFlds (AllFields : Boolean; ColDescs : Array of TGridColDesc) : String;
Procedure SetGridCols (grd : TDBGrid; ColDescs : Array of TGridColDesc);
Function GetENumPrefix (TypInf : PTypeInfo) : String;
Function GetGridColList (grd : TDBGrid; InclWidths : Boolean;
                         TypInf : PTypeInfo; ColDescs : Array of TGridColDesc) : String;
Procedure SetGridColsFromList (TypInf : PTypeInfo;
                               Var ColDescs : Array of TGridColDesc; Const sColList : String);

Procedure FreeStringListObjects (sList : TStrings);
Procedure FreeStringList (Var sList : TStringList);
Function SplitStr (Const S : String; SplitChar : Char) : TStringList;
Function SubString (Const S : String; SplitChar : Char; iSubStr : Integer) : String;    // iSubStr is zero-based
Function ListToStr (sList : TStringList; UseBlanks, UseQuotes, TrimStrings : Boolean;
                    iStart : Integer = 1; nChars : Integer = 0; cDelim : Char = ',') : String;
Function StrListByParagraph (sList : TStrings) : TStringlist;
Function SpaceJustify (Const S : String; nPixels : Integer; grd : TStringGrid) : String;

Function GetIniList (Const sSection : String) : TStringList;

Function Brighter (clr : TColor) : TColor;
Function Darker (clr : TColor) : TColor;


Const
  maxColDescs = 32;
  InclAllFields = TRUE;  InclNonZeroWidthFields = FALSE;
  DoInclWidths = TRUE;   DontInclWidths = FALSE;
  DoUseBlanks = TRUE;    DontUseBlanks = FALSE;
  DoUseQuotes = TRUE;    DontUseQuotes = FALSE;
  DoTrimStrings = TRUE;  DontTrimStrings = FALSE;

implementation

Uses
  Forms, SysUtils, IniFiles, Windows, Math, Dialogs,
  Std_Util;

Constructor TStringObj.Create (Const aString : String);
  Begin                      {Constructor TStringObj.Create}
    Inherited Create;
    sList := TStringList.Create;
    sList.Add (aString)
  End;                       {Constructor TStringObj.Create}

Constructor TStringObj.Create (Const aString1, aString2 : String);
  Begin                      {Constructor TStringObj.Create}
    Inherited Create;
    sList := TStringList.Create;
    sList.Add (aString1);
    sList.Add (aString2)
  End;                       {Constructor TStringObj.Create}

Constructor TStringObj.Create (Const aString : String; ai : Integer);
  Begin                      {Constructor TStringObj.Create}
    Inherited Create;
    sList := TStringList.Create;
    sList.Add (aString);
    i := ai
  End;                       {Constructor TStringObj.Create}

Constructor TStringObj.Create (Const aString : String; aiCurr : Currency);
  Begin                      {Constructor TStringObj.Create}
    Inherited Create;
    sList := TStringList.Create;
    sList.Add (aString);
    iCurr := aiCurr
  End;                       {Constructor TStringObj.Create}

Constructor TStringObj.Create (Const aString1, aString2 : String; ai : Integer);
  Begin                      {Constructor TStringObj.Create}
    Inherited Create;
    sList := TStringList.Create;
    sList.Add (aString1);
    sList.Add (aString2);
    i := ai
  End;                       {Constructor TStringObj.Create}

Constructor TStringObj.Create (aStrings : Array of String); 
  Var
    iStr : Integer;
  Begin                      {Constructor TStringObj.Create}
    Inherited Create;
    sList := TStringList.Create;
    For iStr := Low (aStrings) to High (aStrings) Do
      sList.Add (aStrings[iStr])
  End;                       {Constructor TStringObj.Create}

Destructor TStringObj.Destroy;
  Begin                      {Destructor TStringObj.Destroy}
    sList.Free;
    Inherited
  End;                       {Destructor TStringObj.Destroy}

Function TStringObj.GetS : String;
  Begin
    Result := sList.Strings[0]
  End;

Function TStringObj.GetS2 : String;
  Begin
    Result := sList.Strings[1]
  End;

Function TStringObj.GetStrings (Index : Integer) : String;
  Begin
    Result := sList.Strings[Index]
  End;

Procedure TStringObj.SetStrings (Index : Integer; NewValue : String);
  Begin                      {Procedure TStringObj.SetStrings}
    With sList Do
      Begin
        While Count - 1 < Index Do
          Add ('');
        Strings[Index] := NewValue
      End
  End;                       {Procedure TStringObj.SetStrings}

Procedure TStringObj.AddString (Const aString : String);
  Begin
    sList.Add (aString)
  End;

Function TStringObj.StringCount : Integer;
  Begin
    Result := sList.Count
  End;


(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

Function GridColsMinWidth (ColDescs : Array of TGridColDesc) : Integer;
  Var
    i, nVisCols : Integer;
  Begin                      {Function GridColsMinWidth}
    {See how many 1-pixel-wide separator lines we'll need.}
    nVisCols := 0;
    For i := Low (ColDescs) to High (ColDescs) Do
      If ColDescs[i].MinWidth > 0
        Then Inc (nVisCols);
    Result := nVisCols - 1;

    For i := Low (ColDescs) to High (ColDescs) Do
      Inc (Result, ColDescs[i].MinWidth)
  End;                       {Function GridColsMinWidth}

Function GetGridFlds (AllFields : Boolean; ColDescs : Array of TGridColDesc) : String;
  Var
    i : Integer;
  Begin                      {Function GetGridFlds}
    Result := '';
    For i := Low (ColDescs) to High (ColDescs) Do
      With ColDescs[i] Do
        If AllFields or (MinWidth > 0)
          Then Result := Result + ',' + FldName;
    Result := Copy (Result, 2, Length (Result) - 1)
  End;                       {Function GetGridFlds}

Procedure SetGridCols (grd : TDBGrid; ColDescs : Array of TGridColDesc);
  Var
    i, nVisCols, TotVarWidth, TotMinWidth, TotWidth, w : Integer;
    PixPerVar, CumWidth, Wid : Single;
  Begin                      {Procedure SetGridCols}
    With grd.Columns Do
      Begin
        BeginUpdate;
        Clear;

        {See how much latitude we have for adjusting the available space.  Also,
         count the number of visible columns -- that have a MinWidth > 0.}
        TotVarWidth := 0;  TotMinWidth := 0;  nVisCols := 0;
        For i := Low (ColDescs) to High (ColDescs) Do
          With ColDescs[i] Do
            If MinWidth > 0
              Then Begin
                Inc (TotVarWidth, VarWidth);
                Inc (TotMinWidth, MinWidth);
                Inc (nVisCols)
              End;
        Try
          PixPerVar := (grd.ClientWidth - (TotMinWidth + nVisCols - 1)) / TotVarWidth
        Except
          PixPerVar := 1.0
        End;

        {Set up the non-zero-width columns, adjusting the widths as we go.}
        TotWidth := 0;
        CumWidth := 0.0;
        For i := Low (ColDescs) to High (ColDescs) Do
          With ColDescs[i] Do
            If MinWidth > 0
              Then With Add Do
                Begin
                  FieldName := FldName;
                  Alignment := Alignmt;
                  Title.Caption := ColCapt;
                  Title.Alignment := CaptAlign;

                  {Figure the adjusted width of the column.  Add the exact amount to the accumulating total,
                   and then round the difference for the current column's width.  If that puts us wider
                   than the whole grid, just grab what's left of the grid.}
                  Wid := VarWidth;    // to convert it from an integer to a float
                  CumWidth := CumWidth + MinWidth + (Wid * PixPerVar);
                  w := Round (CumWidth) - TotWidth;
                  If w + TotWidth > grd.ClientWidth
                    Then w := grd.ClientWidth - TotWidth;
                  Width := w;
                  Inc (TotWidth, w);

                  {Add a pixel for the vertical separator line.}
                  Inc (TotWidth);
                  CumWidth := CumWidth + 1.0
                End;
        EndUpdate
      End
  End;                       {Procedure SetGridCols}

Function GetENumPrefix (TypInf : PTypeInfo) : String;
  Var
    i : Integer;
  Begin                      {Function GetENumPrefix}
    {Grab the first name in the enumerated type list.  The lower-case letters at the beginning are
     the prefix letters that are "pre-pended" to the field names to create the enumerated type names.}
    Result := GetEnumName (TypInf, 0);
    i := 1;
    While (i <= Length (Result)) and (Result[i] >= 'a') Do
      Inc (i);
    Result := Copy (Result, 1, i - 1)
  End;                       {Function GetENumPrefix}

Function GetGridColList (grd : TDBGrid; InclWidths : Boolean;
                         TypInf : PTypeInfo; ColDescs : Array of TGridColDesc) : String;
  Var
    i : Integer;
    sPrefix : String;
  Begin                      {Function GetGridColList}
    sPrefix := GetENumPrefix (TypInf);

    Result := '';
    With grd.Columns Do
      For i := 0 to Count - 1 Do
        With Items[i] Do
          Begin
            {Add the enumerated type name, composed of the prefix and column's fieldname.}
            If Length (Result) > 0
              Then Result := Result + ',';
            Result := Result + sPrefix + FieldName;

            {Add the column width if requested.}
            If InclWidths
              Then Result := Result + ' ' + IntToStr (Width)
          End
  End;                       {Function GetGridColList}

Procedure SetGridColsFromList (TypInf : PTypeInfo;
                               Var ColDescs : Array of TGridColDesc; Const sColList : String);
  Var
    nCols, i, iPos, ColENum : Integer;
    InclCols : Set of Byte;
    sColENumName, sColWidth, sPrefix : String;
    HoldColDescs : Array [0..maxColDescs - 1] of TGridColDesc;
  Begin                      {Procedure SetGridColsFromList}
    sPrefix := GetENumPrefix (TypInf);
    Move (ColDescs, HoldColDescs, SizeOf (ColDescs));
    InclCols := [];
    nCols := 0;

    With SplitStr (sColList, ',') Do
      Begin
        For i := 0 to Count - 1 Do
          Begin
            {If the string contains a blank, then separate the name from the column width.  This
             was set up in Function GetGridColList if parameter InclWidths was TRUE.}
            sColENumName := Strings[i];
            iPos := Pos (' ', sColENumName);
            If iPos = 0
              Then sColWidth := ''
              Else Begin
                sColWidth := Copy (sColENumName, iPos + 1, Length (sColENumName) - iPos);
                sColENumName := Copy (sColENumName, 1, iPos - 1)
              End;
            System.Delete (sColENumName, 1, Length (sPrefix));

            {Find this column's fieldname in the array of column descriptors.}
            ColENum := 0;
            While (ColENum <= High (ColDescs)) and (HoldColDescs[ColENum].FldName <> sColENumName) Do
              Inc (ColENum);
            If ColENum <= High (ColDescs)    // should never fail
              Then Begin
                {Copy the original column description information into this column.}
                System.Move (HoldColDescs[ColENum], ColDescs[nCols], SizeOf (TGridColDesc));
                InclCols := InclCols + [ColENum];

                {If there was a blank in the input string, it was probably followed by the width of the column
                 in pixels.}
                If Length (sColWidth) > 0
                  Then Try
                    ColDescs[nCols].MinWidth := StrToInt (sColWidth)
                  Except
                  End;
                Inc (nCols)
              End
          End;
        Free    // the SplitStr TStringList
      End;

    {Reload any remaining columns, but set the MinWidth value to 0 so the columns won't be displayed.}
    For i := 0 to High (ColDescs) Do
      If not (i in InclCols)
        Then Begin
          Move (HoldColDescs[i], ColDescs[nCols], SizeOf (TGridColDesc));
          ColDescs[nCols].MinWidth := 0;
          Inc (nCols)
        End
  End;                       {Procedure SetGridColsFromList}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

Procedure FreeStringListObjects (sList : TStrings);
  Var
    iIndex : Integer;
  Begin                      {Procedure FreeStringListObjects}
    If not Assigned (sList)
      Then Exit;
    With sList Do
      For iIndex := 0 to Count - 1 Do
        If Assigned (Objects[iIndex])
          Then Begin
            If Objects[iIndex] is TStrings
              Then FreeStringListObjects (TStrings(Objects[iIndex]));
            Objects[iIndex].Free
          End
  End;                       {Procedure FreeStringListObjects}

Procedure FreeStringList (Var sList : TStringList);
  Var
    iIndex : Integer;
    sSubStringList : TStringList;
  Begin                      {Procedure FreeStringList}
    If not Assigned (sList)
      Then Exit;
    With sList Do
      Begin
        For iIndex := 0 to Count - 1 Do
          If Assigned (Objects[iIndex])
            Then If Objects[iIndex] is TStringList
              Then Begin
                sSubStringList := TStringList(Objects[iIndex]);
                FreeStringList (sSubStringList);
                Objects[iIndex] := NIL
              End
              Else If Objects[iIndex] is TStrings
                Then Begin
                  FreeStringListObjects (TStrings(Objects[iIndex]));
                  Objects[iIndex] := NIL
                End
                Else Objects[iIndex].Free;
        Free    // sList
      End;
    sList := NIL
  End;                       {Procedure FreeStringList}

Function SplitStr (Const S : String; SplitChar : Char) : TStringList;
  {Returns a TStringList object containing a list of sub-strings of S as separated
   by the SplitChar character.  It is the responsibility of the calling routine to
   Free the returned TStringList.}
  Var
    i, j : Integer;
  Begin                      {Function SplitStr}
    Result := TStringList.Create;
    If Length (S) = 0
      Then Exit;

    If Pos (SplitChar, S) = 0
      Then Begin
        Result.Add (S);
        Exit
      End;

    i := 1;  j := i;
    While i <= Length (S) Do
      Begin
        j := i;
        While (j <= Length (S)) and (S[j] <> SplitChar) Do
          Inc (j);
        Result.Add (Copy (S, i, j - i));
        i := j + 1
      End;

    {If the last character was the delimiter, add a blank line at the end.}
    If (j = Length (S)) and (S[Length (S)] = SplitChar)
      Then Result.Add ('')
  End;                       {Function SplitStr}

Function SubString (Const S : String; SplitChar : Char; iSubStr : Integer) : String;
  Begin                      {Function SubString}
    With SplitStr (S, SplitChar) Do
      Begin
        If iSubStr < Count
          Then Result := Strings[iSubStr]
          Else Result := '';
        Free    // SplitStr
      End
  End;                       {Function SubString}

Function ListToStr (sList : TStringList; UseBlanks, UseQuotes, TrimStrings : Boolean;
                    iStart : Integer = 1; nChars : Integer = 0; cDelim : Char = ',') : String;
  Var
    i, n : Integer;
    sBlank, sQuotes, sString : String;
  Begin                      {Function ListToStr}
    If UseBlanks
      Then sBlank := cDelim + ' '
      Else sBlank := cDelim + '';
    If UseQuotes
      Then sQuotes := ''''
      Else sQuotes := '';
    Result := '';
    With sList Do
      For i := 0 to Count - 1 Do
        Begin
          If Length (Result) > 0
            Then Result := Result + sBlank;

          If nChars = 0
            Then n := Length (Strings[i])
            Else n := nChars;
          sString := Copy (Strings[i], iStart, n);
          If TrimStrings
            Then sString := Trim (sString);
          Result := Result + sQuotes + sString + sQuotes
        End
  End;                       {Function ListToStr}

Function StrListByParagraph (sList : TStrings) : TStringlist;
  {This routine accumulates the individual lines in sList into fewer, longer strings as paragraphs that it
   returns in a TStringList.  It may be useful, for example, in converting the lines of a TMemo in preparation
   for sending them as an e-mail message.  The routine recognizes "paragraphs" by blank lines between groups
   of contiguous lines.}
  Var
    i, iLen : Integer;
    sAccum : String;
  Begin                      {Function StrListByParagraph}
    Result := TStringList.Create;

    i := 0;
    sAccum := '';
    With sList Do
      While i < Count Do
        Begin
          If Length (Strings[i]) = 0
            Then Begin
              Result.Add (sAccum);
              sAccum := '';
            End
            Else Begin
              iLen := Length (sAccum);
              If (iLen > 0) and (sAccum[iLen] <> ' ')
                Then sAccum := sAccum + ' ';
              sAccum := sAccum + Strings[i]
            End;
          Inc (i)
        End;
    If Length (sAccum) > 0
      Then Result.Add (sAccum)
  End;                       {Function StrListByParagraph}

Function SpaceJustify (Const S : String; nPixels : Integer; grd : TStringGrid) : String;
  Begin                      {Function SpaceJustify}
    With grd.Canvas Do
        Result := StringOf (' ', (nPixels - TextWidth (S)) div TextWidth (' ')) + S
  End;                       {Function SpaceJustify}


(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

Function GetIniList (Const sSection : String) : TStringList;
  Var
    i : Integer;
    sIniFName : String;
  Begin                      {Function GetIniList}
    Result := TStringList.Create;
    sIniFName := Application.ExeName;
    sIniFName := Copy (sIniFName, 1, Length (sIniFName) - 3) + 'ini';
    With TIniFile.Create (sIniFName) Do
      Begin
        ReadSection (sSection, Result);
        With Result Do
          For i := 0 to Count - 1 Do
            Strings[i] := ReadString (sSection, Strings[i], '');
        Free
      End
  End;                       {Function GetIniList}


Const
  ColorAdjustFactor = 0.7;    {This value was copied from java.awt.Color.}

Function Brighter (clr : TColor) : TColor;
  {Creates a brighter version of this color.  It was copied from java.awt.Color.brighter().}
  Var
    i, r, g, b : Integer;
  Begin                      {Function Brighter}
    {This method applies an arbitrary scale factor to each of the three RGB components of the color
     to create a brighter version of the same color.  Although Brighter and Darker are inverse operations,
     the results of a series of invocations of these two methods may be inconsistent because of rounding
     errors.  These rules apply:
       1. Brighter (clBlack) should return clGray.
       2. Applying Brighter to clBlue will always return a brighter shade of blue.
       3. Calling Brighter repeatedly on a non-pure color (non-zero rgb) will eventually return clWhite.}

    r := GetRValue (clr);
    g := GetGValue (clr);
    b := GetBValue (clr);

    i := Round (1.0 / (1.0 - ColorAdjustFactor));
    If (r = 0) and (g = 0) and (b = 0)
      Then Result := RGB (i, i, i)
      Else Begin
        If ((r > 0) and (r < i))  Then r := i;
        If ((g > 0) and (g < i))  Then g := i;
        If ((b > 0) and (b < i))  Then b := i;
        Result := RGB (Min (Round (r / ColorAdjustFactor), 255),
                       Min (Round (g / ColorAdjustFactor), 255),
                       Min (Round (b / ColorAdjustFactor), 255))
      End
  End;                       {Function Brighter}

Function Darker (clr : TColor) : TColor;
  {Creates a darker version of this color.  It was copied from java.awt.Color.darker().}
  Begin                      {Function Darker}
    {This method applies an arbitrary scale factor to each of the three RGB components of the color
     to create a darker version of the same color.}
    Result := RGB (Max (Round (GetRValue (clr) * ColorAdjustFactor), 0),
                   Max (Round (GetGValue (clr) * ColorAdjustFactor), 0),
                   Max (Round (GetBValue (clr) * ColorAdjustFactor), 0))
  End;                       {Function Darker}

end.
