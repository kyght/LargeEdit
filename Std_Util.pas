Unit Std_Util;


Interface

  Uses
    Classes, SysUtils, StdCtrls, Grids;

  Type
    ppEType = (ppLeft, ppCent, ppRight);      { pp = pad position }

  Const
    DoUseKAbbr = TRUE;  DontUseKAbbr = FALSE;

  Function RightJust (Const S : ShortString; TotLen : Byte) : ShortString;
  Function PadStr (Const S : ShortString; PadCh : Char;
                   PadPos : ppEType; TotLen : Byte) : ShortString;
  Function TrimStr (Const S : String; PadPos : ppEType) : String;
  Function StripOut (Const S : String; StripCh : Char) : String;
  Function ForceStrLen (Const S : String; TotLen : Byte) : String;
  Function LastPos (c : Char; Const S : String) : Byte;
  Function CountChars (c : Char; Const S : String) : Byte;
  Function StringOf (AscChar : Char; nCopies : Byte) : ShortString;
  Function RtJustStr (Const S : String; FldLen : Integer) : String;
  Function MakeStr (Var V; nBytes : Byte) : ShortString;
  Procedure LoadOutStr (Const S : String; Var sOut : String; i : Integer);
  Procedure LoadStrToVar (Const S : String; Var varOut);
  Function UpCaseStr (Const S : String) : String;
  Function SubstChars (Const S, sOld, sNew : String) : String;
  Function BumpSerial (Const S : String) : String;
  Function BoolStr (b : Boolean) : String;
  Function RealToStr (r : Real; nDecPl : Word) : String;
  Function HexToInt (Const S : String) : Integer;
  Function IncHex (Const S : String; IncVal : Integer) : String;
  Function FillDate (S : String) : String;
  Function ZeroPadNumStr (n : Word; TotLen : Byte) : String;
  Function StripNumStr (Const S : String) : String;
  Function GetYYMMYrNum (YYMM : String) : Word;
  Function GetPosInt (Const S : String) : LongInt;
  Function ExtractNum (S : String; AfterPos : Byte) : Real;
  Function RvrsNameWithInit (S : String) : String;
  Function RvrsName (Const S : String) : String;
  Function AorAn (Const S, Sample : String) : String;
  Function SingPlur (Const S : String; Quant : LongInt) : String;
  Function IIFStr (B : Boolean; Const sIfTrue, sIfFalse : String) : String;
  Function CountStr (Const S : String; Quant : LongInt) : String;
  Function InsertCommas (Const S : String; UseKAbbr : Boolean) : String;
  Function OrdStr (i : Integer) : String;
  Function IsDigit (c : Char) : Boolean;
  Function IsAlpha (c : Char) : Boolean;
  Function IsAllAlpha (Const S : String) : Boolean;
  Function IsAllNumeric (Const S : String) : Boolean;
  Function IsNumeric (Const S : String) : Boolean;
  Procedure CleanMemoBuffEnd (pStart : PChar; BuffSz : Word);
  Function DropAmpersand (Const S : String) : String;
  Function DoubleChar (Const S : String; c : Char) : String;
  Function SplitStr (Const S : String; SplitChar : Char) : TStringList;
  Function Tokenize (Const S : String) : TStringList;
  Function BuildListString (sL : TStringList) : string;
  Procedure CleanUpIniSect (sL : TStrings);

  Function MatchingKeywords (Const Keys1, Keys2 : String) : Word;
  Function CountKeywords (Const Keys : String) : Word;

  Function CompareStrLists (Const sLstA, sLstB : TStringList) : TStringList;

  Function Scramble (Const S : String) : String;
  Function Unscramble (Const S : String) : String;

  Procedure SetAllSelect (LstBx : TListBox);
  Procedure PreSelect (LstBx : TListBox; Const sSel : String);
  Function BuildSelectStr (LstBx : TListBox) : String;

  Procedure ClearGrid (grd : TStringGrid);
  Procedure InsertGridRow (grd : TStringGrid; AtRow : Integer);
  Procedure DropGridRow (grd : TStringGrid; DropRow : Integer);

  Function StrToY2KDate (Const S : String) : TDateTime;
  Function DtYear (Dt : TDateTime) : Word;
  Function DtMonth (Dt : TDateTime) : Word;
  Function DtDay (Dt : TDateTime) : Word;
  Function DtBegMonth (Dt : TDateTime) : TDateTime;
  Function DtEndMonth (Dt : TDateTime) : TDateTime;
  Function DtNearestDayOfWeek (Dt : TDateTime; Direction : Real; DayOfWk : Integer) : TDateTime;
  Function FixDate (Const S : String) : String;
  Procedure Delay (nSecs : Word);

  Function MaxReal (V1, V2 : Real) : Real;
  Function MinReal (V1, V2 : Real) : Real;
  Function MaxInt (V1, V2 : LongInt) : LongInt;
  Function MinInt (V1, V2 : LongInt) : LongInt;

  Function VarEqual (Var V1, V2; nBytes : Word) : Boolean;
  Function VarEquiv (Var V1, V2; nBytes : Word) : Boolean;
  Function VarLessThan (Var V1, V2; nBytes : Word) : Boolean;
  Function VarEmpty (Var V1; nBytes : Word) : Boolean;
  Function VarNull (Var V1; nBytes : Word) : Boolean;
  Procedure SwapVars (Var Val1, Val2; ValLen : Word);

  Function IniFName (Const fName : String) : String;  OverLoad;
  Function IniFName : String;  OverLoad;
  Function GetFileSize (Const FName : String) : LongInt;
  Procedure EraseFile (Const FName : String);
  Function FExtFromDate : String;
  Function IsHTML (Const FName : String) : Boolean;

Implementation

  Uses
    Forms, Controls, Dialogs;

  Function RightJust (Const S : ShortString; TotLen : Byte) : ShortString;
    {Returns a string of TotLen characters with S at the end.}
    Begin                    {Function RightJust}
      Result := PadStr (Trim (S), ' ', ppLeft, TotLen)
    End;                     {Function RightJust}

  Function PadStr (Const S : ShortString; PadCh : Char;
                   PadPos : ppEType; TotLen : Byte) : ShortString;
    {Returns a string of TotLen characters consisting of S and a number of PadCh characters.
     PadPos indicates where the padding is to go.}
    Var
      Pad : ShortString;
    Begin                    {Function PadStr}
      If Length (S) >= TotLen
        Then Begin
          Result := S;
          Exit
        End;

      {Build the string of pad characters.}
      Pad[0] := Chr (TotLen - Length (S));
      FillChar (Pad[1], Length (Pad), PadCh);
      Case PadPos of
        ppLeft  : Result := Pad + S;
        ppCent  : Begin
                    If Odd (Ord (Pad[0]))
                      Then Inc (Pad[0]);
                    Pad[0] := Chr (Ord (Pad[0]) div 2);

                    Result := Pad + S + Pad;
                    If Length (Result) > TotLen
                      Then Dec (Result[0])
                  End;
        ppRight : Result := S + Pad
      End
    End;                     {Function PadStr}


  Function TrimStr (Const S : String; PadPos : ppEType) : String;
    {Returns a string consisting of S less certain blanks and null characters.
     The PadPos value indicates these actions:

          ppLeft  : leading blanks are removed
          ppCent  : leading and trailing blanks are removed
          ppRight : trailing blanks are removed

     If the input string contains only one or more blanks, the return string
     contains one blank.  If the input string is empty, so is the return string.}
    Var
      i, j : Byte;
    Begin                    {Function TrimStr}
      {Find the beginning and ending character indices for the PadPos trimming.}
      Case PadPos of
        ppLeft  : Begin
                    i := 1;
                    While ((S[i] = ' ') or (S[i] = #0)) and (i < Length (S)) Do
                      Inc (i);
                    j := Length (S) - i + 1
                  End;
        ppCent  : Begin
                    i := 1;
                    While ((S[i] = ' ') or (S[i] = #0)) and (i < Length (S)) Do
                      Inc (i);
                    j := Length (S);
                    While ((S[j] = ' ') or (S[j] = #0)) and (j > i) Do
                      Dec (j);
                    j := j - i + 1
                  End;
        Else      Begin     // ppRight
                    i := 1;
                    j := Length (S);
                    While ((S[j] = ' ') or (S[j] = #0)) and (j > i) Do
                      Dec (j);
                    j := j - i + 1
                  End
      End;

      Result := Copy (S, i, j);
      If Result = ' '
        Then Result := ''
    End;                     {Function TrimStr}

  Function StripOut (Const S : String; StripCh : Char) : String;
    Var
      i : Integer;
    Begin                    {Function StripOut}
      Result := S;
      i := Length (Result);
      While i > 0 Do
        Begin
          If S[i] = StripCh
            Then Delete (Result, i, 1);
          Dec (i)
        End
    End;                     {Function StripOut}

  Function ForceStrLen (Const S : String; TotLen : Byte) : String;
    {Returns S, but with a string length of TotLen characters.  If Length (S) > TotLen, S is truncated.  If
     Length (S) < TotLen, S is right-padded.}
    Var
      sLen : Byte;
    Begin                    {Function ForceStrLen}
      sLen := Length (S);
      If sLen = TotLen
        Then Result := S
        Else If sLen < TotLen
          Then Result := S + StringOf (' ', TotLen - sLen)
          Else Result := Copy (S, 1, TotLen)
    End;                     {Function ForceStrLen}

  Function LastPos (c : Char; Const S : String) : Byte;
    {Returns the index of the last occurrence of c in S or 0 if c does not occur in S.}
    Begin                    {Function LastPos}
      Result := Length (S);
      While (Result > 0) and (S[Result] <> c) Do
        Dec (Result)
    End;                     {Function LastPos}

  Function CountChars (c : Char; Const S : String) : Byte;
    {Returns a count of the number of occurrences of c in S.}
    Var
      i : Integer;
    Begin                    {Function CountChars}
      Result := 0;
      For i := 1 to Length (S) Do
        If S[i] = c
          Then Inc (Result)
    End;                     {Function CountChars}

  Function StringOf (AscChar : Char; nCopies : Byte) : ShortString;
    {Returns a string containing nCopies of ch.}
    Begin                    {Function StringOf}
      Result[0] := Chr (nCopies);
      FillChar (Result[1], nCopies, AscChar)
    End;                     {Function StringOf}

  Function RtJustStr (Const S : String; FldLen : Integer) : String;
    {Returns S with any leading blanks or zeros and any trailing blanks removed, the right-justified with
     blanks to a length of FldLen characters.}
    Begin                    {Function RtJustStr}
      Result := Trim (S);                            // drop leading and trailing blanks
      While (Length (Result) > 0) and (Result[1] = '0') Do   // drop leading '0' characters
        Result := Copy (Result, 2, Length (Result) - 1);
      If Length (Result) < FldLen
        Then Result := StringOf (' ', FldLen - Length (Result)) + Result  //right-justify
    End;                     {Function RtJustStr}


  Function MakeStr (Var V; nBytes : Byte) : ShortString;
    {Returns a string containing nBytes starting at V.}
    Begin                    {Function MakeStr}
      Move (V, Result[1], nBytes);
      Result[0] := Chr (nBytes)
    End;                     {Function MakeStr}


  Procedure LoadOutStr (Const S : String; Var sOut : String; i : Integer);
    {Loads S into sOut, starting at character index i.}
    Begin
      Move (S[1], sOut[i], Length (S))
    End;

  Procedure LoadStrToVar (Const S : String; Var varOut);
    {Loads S into varOut.}
    Begin
      Move (S[1], varOut, Length (S))
    End;

  Function UpCaseStr (Const S : String) : String;
    {Returns a copy of S in which all lower-case letters have been made upper-case.}
    Var
      i : Integer;
    Begin                    {Function UpCaseStr}
      Result := S;
      For i := 1 to Length (S) Do
        Result[i] := UpCase (Result[i])
    End;                     {Function UpCaseStr}

  Function SubstChars (Const S, sOld, sNew : String) : String;
    Var
      i, iPos : Integer;
    Begin
      Result := S;
      For i := 1 to Length (Result) Do
        Begin
          iPos := Pos (Result[i], sOld);
          If iPos > 0
            Then If iPos > Length (sNew)
              Then System.Delete (Result, i, 1)
              Else Result[i] := sNew[iPos]
        End
    End;

  Function BumpSerial (Const S : String) : String;
    {S is presumed to be a serial number consisting only of digits and upper-case letters.  The
     return value is the next number.  If S is already the last value for the number of characters,
     an 'A' is inserted at the beginning of the string.}
    Var
      Done : Boolean;
      i : Integer;
    Begin                    {Function BumpSerial}
      Result := S;
      Done := FALSE;
      i := Length (Result);
      Repeat
        If Result[i] in ['0'..'9']
          Then If Result[i] < '9'
            Then Begin  Inc (Result[i]);  Done := TRUE  End
            Else Begin  Result[i] := '0';  Dec (i)  End
          Else If Result[i] in ['A'..'Z']
            Then If Result[i] < 'Z'
              Then Begin  Inc (Result[i]);  Done := TRUE  End
              Else Begin  Result[i] := 'A';   Dec (i)  End
            Else Dec (i);

        If not Done and (i = 0)
          Then Begin
            Insert ('A', Result, 1);
            Done := TRUE
          End
      Until Done
    End;                     {Function BumpSerial}

  Function BoolStr (b : Boolean) : String;
    Begin                    {Function BoolStr}
      If b
        Then BoolStr := 'TRUE'
        Else BoolStr := 'FALSE'
    End;                     {Function BoolStr}

  Function RealToStr (r : Real; nDecPl : Word) : String;
    Begin
      Str (r:15:nDecPl, Result);
      Result := TrimStr (Result, ppCent)
    End;

  Function HexToInt (Const S : String) : Integer;
    Var
      i, iOfs, iPlc : Integer;
    Begin                    {Function HexToInt}
      Result := 0;
      iPlc := 0;
      For i := Length (S) downto 1 Do
        Begin
          Case S[i] of
            '0'..'9' : iOfs := Ord ('0');
            'A'..'F' : iOfs := Ord ('A') - 10;
            'a'..'f' : iOfs := Ord ('a') - 10;
            Else       Raise Exception.Create ('Invalid hex character: "' + S[i] + '"')
          End;
          Inc (Result, (Ord (S[i]) - Ord (iOfs)) ShL (4 * iPlc));
          Inc (iPlc)
        End
    End;                     {Function HexToInt}

  Function IncHex (Const S : String; IncVal : Integer) : String;
    Begin
      Result := IntToHex (HexToInt (S) + IncVal, Length (S))
    End;

  Function FillDate (S : String) : String;
    {Adds zeros as needed to make S be an 8-character MM/DD/YY date.  Each
     of the parts of S may have only one digit.}

    Begin
      If (Length (S) >= 5) and (Length (S) < 8)
        Then Begin
          If S[2] = '/'
            Then Insert ('0', S, 1);
          If S[5] = '/'
            Then Insert ('0', S, 4);
          If Length (S) < 8
            Then Insert ('0', S, 7)
        End;
      Result := S
    End;


Function ZeroPadNumStr (n : Word; TotLen : Byte) : String;
  {Returns a string of TotLen characters representing the value n and left-padded
   with '0' characters.}
  Var
    i : Integer;
    S : String;
  Begin                      {Function ZeroPadNumStr}
    Str (n:TotLen, S);
    i := 1;
    While (i < Length (S)) and (S[i] = ' ') Do
      Begin
        S[i] := '0';
        Inc (i)
      End;
    ZeroPadNumStr := S
  End;                       {Function ZeroPadNumStr}

Function StripNumStr (Const S : String) : String;
  Begin                      {Function StripNumStr}
    Result := Trim (S);
    While (Length (Result) > 0) and (Result[1] = '0') Do
      System.Delete (Result, 1, 1);
    If Length (Result) = 0
      Then Result := '0'
  End;                       {Function StripNumStr}

Function GetYYMMYrNum (YYMM : String) : Word;
  {Returns the year number of the YYMM date string.  If YY is less than 60, the
   routine assumes that the century is 1900; otherwise, it's 2000.}
  Begin                      {Function GetYYMMYrNum}
    Result := ((Ord (YYMM[1]) - Ord ('0')) * 10) + Ord (YYMM[2]) - Ord ('0');
    If Result < 60
      Then Inc (Result, 2000)
      Else Inc (Result, 1900)
  End;                       {Function GetYYMMYrNum}


Function GetPosInt (Const S : String) : LongInt;
  {Returns the integer represented in S.  If it's not a number, the result is -1.}
  Begin                      {Function GetPosInt}
    Try
      Result := StrToInt (S)
    Except
      Result := -1
    End
  End;                       {Function GetPosInt}


Function ExtractNum (S : String; AfterPos : Byte) : Real;
  {Returns the first numeric value in digits within S starting with byte AfterPos.}
  Const
    NumChars : Set of Char = ['-', '.', '0'..'9'];
  Var
    Neg, DecPt : Boolean;
    WholePt, FractPt : LongInt;
  Begin                      {Function ExtractNum}
    Result := 0.0;
    While (AfterPos <= Length (S)) and not (S[AfterPos] in NumChars) Do
      Inc (AfterPos);
    If AfterPos > Length (S)
      Then Exit;

    Neg := FALSE;
    DecPt := FALSE;
    WholePt := 0;
    FractPt := 0;
    While (AfterPos <= Length (S)) and (S[AfterPos] in NumChars) Do
      Begin
        Case S[AfterPos] of
          '-' : If not Neg and
                   ((WholePt > 0) or (FractPt > 0)) and
                   (AfterPos < Length (S)) and
                   (S[AfterPos + 1] in NumChars) and
                   (S[AfterPos + 1] <> '-')
                  Then Neg := TRUE
                  Else AfterPos := Length (S);

          '.' : If not DecPt
                  Then DecPt := TRUE
                  Else AfterPos := Length (S);

          Else If DecPt
            Then FractPt := FractPt * 10 + Ord (S[AfterPos]) - Ord ('0')
            Else WholePt := WholePt * 10 + Ord (S[AfterPos]) - Ord ('0')
        End;
        Inc (AfterPos)
      End;
    Result := FractPt;
    While Result > 1.0 Do
      Result := Result / 10.0;
    Result := Result + WholePt;
    If Neg
      Then Result := Result * -1.0
  End;                       {Function ExtractNum}


Function RvrsNameWithInit (S : String) : String;
  {Assuming that S contains a person's last name, a comma, and the first initial, this
   routine reverses it and returns a string containing the initial and then the last name.}
  Var
    CommaPos : Integer;
  Begin                      {Function RvrsNameWithInit}
    CommaPos := Pos (',', S);
    If CommaPos = 0
      Then Result := S
      Else Begin
        S := TrimStr (S, ppCent);
        Result := TrimStr (Copy (S, CommaPos + 1, Length (S) - CommaPos) + ' ' +
                           Copy (S, 1, CommaPos - 1), ppCent)
      End
  End;                       {Function RvrsNameWithInit}


Function RvrsName (Const S : String) : String;
  {If S contains a person's last name, a comma, and the first name or initial, this routine reverses it and
   returns a string containing the name or initial and then the last name.  If S does not have a comma, the
   routine returns a string starting with the last name, followed by a comma, a space, and the rest of S.}
  Var
    i, CommaPos : Integer;
  Begin                      {Function RvrsName}
    Result := Trim (S);
    CommaPos := Pos (',', Result);
    If CommaPos = 0
      Then Begin
        i := Length (Result);
        While (i > 0) and (Result[i] <> ' ') Do
          Dec (i);
        If i > 0
          Then Result := Copy (Result, i + 1, Length (Result) - i) + ', ' + Trim (Copy (Result, 1, i - 1))
      End
      Else Result := Trim (Copy (Result, CommaPos + 1, Length (Result) - CommaPos)) + ' ' +
                     Trim (Copy (Result, 1, CommaPos - 1))
  End;                       {Function RvrsName}


Function AorAn (Const S, Sample : String) : String;
  {Returns S with an 'A' or 'An' prefixed, depending on whether S begins with a vowel.
   The characters (1 or 2) are taken from Sample, so the calling routine determines
   the amount of capitalization.}
  Var
    i : Integer;
  Begin                      {Function AorAn}
    If Length (S) = 0
      Then Result := ''
      Else Begin
        i := 1;
        While not (S[i] in ['0'..'9', 'A'..'Z', 'a'..'z']) and (i <= Length (S)) Do
          Inc (i);
        If i > Length (S)
          Then Result := S
          Else Begin
            If S[i] in ['8', 'A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u']
              Then i := 2
              Else i := 1;
            Result := Copy (Sample, 1, i) + ' ' + S
          End
      End
  End;                       {Function AorAn}

Function SingPlur (Const S : String; Quant : LongInt) : String;
  {Returns a string containing a pluralized version of S, or singular if Quant = 1.  The
   pluralization is simplistic: if S ends in 'y', the 'y' is replaces with 'ies'; otherwise,
   an 's' or 'es' is added.  The routine does not handle exceptions to the pluralization
   rules.  The case of the pluralization characters is consistent with the ending charac-
   ters of the input string.}
  Begin                      {Function SingPlur}
    If (Quant = 1) or (Quant = -1)
      Then Result := S
      Else If S[Length (S)] = 'y'
        Then Result := Copy (S, 1, Length (S) - 1) + 'ies'
        Else If S[Length (S)] = 'Y'
          Then Result := Copy (S, 1, Length (S) - 1) + 'IES'
          Else If Pos ('ch', S) = Length (S) - 1
            Then Result := S + 'es'
            Else If Pos ('CH', S) = Length (S) - 1
              Then Result := S + 'ES'
              Else If S[Length (S)] in ['A'..'Z']
                Then Result := S + 'S'
                Else Result := S + 's'
  End;                       {Function SingPlur}

Function IIFStr (B : Boolean; Const sIfTrue, sIfFalse : String) : String;
  Begin                      {Function IIFStr}
    If B
      Then Result := sIfTrue
      Else Result := sIfFalse
  End;                       {Function IIFStr}

Function CountStr (Const S : String; Quant : LongInt) : String;
  Begin                      {Function CountStr}
    Result := InsertCommas (IntToStr (Quant), DontUseKAbbr) +
              SingPlur (IIFStr ((Length (S) > 0) and (S[1] = ' '), S, ' ' + S), Quant)
  End;                       {Function CountStr}

Function OrdStr (i : Integer) : String;
  Begin                      {Function OrdStr}
    Result := IntToStr (i);
    Case Abs (i) mod 100 of
      1, 21, 31, 41, 51, 61, 71, 81, 91 : Result := Result + 'st';
      2, 22, 32, 42, 52, 62, 72, 82, 92 : Result := Result + 'nd';
      3, 23, 33, 43, 53, 63, 73, 83, 93 : Result := Result + 'rd';
      Else  Result := Result + 'th'
    End
  End;                       {Function OrdStr}

Function InsertCommas (Const S : String; UseKAbbr : Boolean) : String;
  {Returns a string based on S, but with leading and trailing blanks removed and commas
   inserts as needed.  If UseKAbbr is TRUE, the last three digits are replaced with a 'K'.}
  Var
    Bumping : Boolean;
    i : Integer;
  Begin                      {Function InsertCommas}
    Result := Trim (S);

    {Find the location for the last comma, allowing for decimal positions,
     if present.}
    i := Pos ('.', Result);
    If i > 0
      Then Dec (i, 3)
      Else i := Length (Result) - 2;

    {Insert the commas.}
    While i > 0 Do
      Begin
        If (i > 1) and (Result[i - 1] <> '-')
          Then Insert (',', Result, i);
        Dec (i, 3)
      End;

    {Transform the thousands to K's, if desired.  This algorithm presumes that
     numbers this large don't also have decimal places.}
    If UseKAbbr and (Length (Result) > 4)
      Then Begin
        {Round the number if need be.}
        If Result[Length (Result) - 2] >= '5'
          Then Begin
            i := Length (Result) - 4;
            Bumping := TRUE;
            While (i > 0) and Bumping Do
              Begin
                Inc (Result[i]);
                If Result[i] <= '9'
                  Then Bumping := FALSE
                  Else Begin
                    Result[i] := '0';
                    Dec (i);
                    If Result[i] = ','
                      Then Dec (i)
                  End
              End;
            If (i = 0) and Bumping
              Then Insert ('1', Result, 1)
          End;
        Result := Copy (Result, 1, Length (Result) - 4) + 'K'
      End
  End;                       {Function InsertCommas}

Function IsDigit (c : Char) : Boolean;
  Begin
    Result := c in ['0'..'9']
  End;

Function IsAlpha (c : Char) : Boolean;
  Begin
    Result := c in ['A'..'Z', 'a'..'z']
  End;

Function IsAllAlpha (Const S : String) : Boolean;
  {Returns TRUE if all of the characters in S are letters.}
  Var
    i : Integer;
  Begin                      {Function IsAllAlpha}
    Result := TRUE;
    i := 1;
    While Result and (i <= Length (S)) Do
      If S[i] in ['A'..'Z', 'a'..'z']
        Then Inc (i)
        Else Result := FALSE
  End;                       {Function IsAllAlpha}

Function IsAllNumeric (Const S : String) : Boolean;
  {Returns TRUE if all of the characters in S are digits.}
  Var
    i : Integer;
  Begin                      {Function IsAllNumeric}
    Result := TRUE;
    i := 1;
    While Result and (i <= Length (S)) Do
      If S[i] in ['0'..'9']
        Then Inc (i)
        Else Result := FALSE
  End;                       {Function IsAllNumeric}

Function IsNumeric (Const S : String) : Boolean;
  Begin                      {Function IsNumeric}
    Try
      StrToFloat (S);
      Result := TRUE
    Except
      Result := FALSE
    End
  End;                       {Function IsNumeric}

Procedure CleanMemoBuffEnd (pStart : PChar; BuffSz : Word);
  {Trims off any trailing nulls, tabs, carriage returns, and blanks from the text buffer
   which starts at pStart and contains BuffSz characters by converting those characters
   to nulls.  This is especially useful for memo fields in which the user may have left
   some junk.}
  Var
    p : PChar;
  Begin                      {Procedure CleanMemoBuffEnd}
    p := pStart + BuffSz - 1;
    While (p > pStart) and (p^ in [#0, #9, #10, #13, ' ']) Do
      Begin
        p^ := #0;
        Dec (p)
      End
  End;                       {Procedure CleanMemoBuffEnd}


Function DropAmpersand (Const S : String) : String;
  {Returns S with the ampersand ('&') characters removed.  If two ampersands appear
   together, only one is removed.}
  Var
    i : Byte;
  Begin                      {Function DropAmpersand}
    Result := S;
    i := 1;
    While i <= Length (Result) Do
      If Result[i] = '&'
        Then Begin
          Delete (Result, i, 1);
          If Result[i] = '&'
            Then Inc (i)
        End
        Else Inc (i)
  End;                       {Function DropAmpersand}

Function DoubleChar (Const S : String; c : Char) : String;
  {Returns S with any single instance of "c" doubled.  For example, if a string contains a legitimate '&'
   and Windows wants to treat it as a hot character (with underscore), this routine can insert an extra
   one, making it appear in Windows as a simple ampersand.  Also, if data being added to an SQL table
   contains an apostrophe, the routine inserts an extra one so the DBMS accepts it as the apostrophe and
   not as the ending quotation mark.}
  Var
    i : Integer;
  Begin                      {Function DoubleChar}
    Result := S;
    i := 1;
    While i <= Length (Result) Do
      Begin
        If Result[i] = c
          Then Begin
            Insert (c, Result, i);
            Inc (i)
          End;
        Inc (i)
      End
  End;                       {Function DoubleChar}


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
    If (j = Length (S)) and (S[Length (S)] = SplitChar)    // in case the last character was the delimiter
      Then Result.Add ('')
  End;                       {Function SplitStr}

Function Tokenize (Const S : String) : TStringList;
  {Returns a TStringList object containing a list of sub-strings of S.  The sub-strings are delimited by
   blanks, and when contiguous non-blank characters switch from numeric to non-numeric, or vice versa.
   It is the responsibility of the calling routine to Free the returned TStringList.}
  Const
    NumChars : Set of Char = ['.', '0'..'9'];
    SepTokens : Set of Char = ['&', '+', ',', '-'];
  Var
    i, j : Integer;
  Begin                      {Function Tokenize}
    {Divide the string into its blank-delimited sub-strings.}
    Result := SplitStr (Trim (S), ' ');
    If Result.Count = 0
      Then Exit;

    {Go through the blank-delimited sub-strings to see if we need to further subdivide any of them.}
    i := 0;
    With Result Do
      While i < Count Do
        If Length (Strings[i]) = 0   
          Then Delete (i)            // remove any empty strings
          Else If Length (Strings[i]) = 1
            Then Inc (i)             // nothing to do if the token is only one character long
            Else Begin
              {First look for token separators, such as '+', '-', ',', and '&'.  If we find one, make it the
               next token and the rest of the string, if any, the token after that.  Then, as the loop proceeds,
               it will further split the remainder string as needed.}
              j := 1;
              While (j <= Length (Strings[i])) and not (Strings[i][j] in SepTokens) Do
                Inc (j);
              If j <= Length (Strings[i])
                Then Begin
                  Insert (i + 1, Strings[i][j]);
                  If j < Length (Strings[i])
                    Then Insert (i + 2, Copy (Strings[i], j + 1, Length (Strings[i]) - j));
                  Strings[i] := Copy (Strings[i], 1, j - 1)
                End;

              {Now look to see if the string switches from numeric to non-, or vice versa.  If so, pull off
               the switched part and insert it into the list after the current string.  Then let the loop
               do its thing again.}
              If Length (Strings[i]) > 1
                Then Begin
                  j := 2;
                  While (j <= Length (Strings[i])) and
                        (((Strings[i][j - 1] in NumChars) and (Strings[i][j] in NumChars)) or
                         (not (Strings[i][j - 1] in NumChars) and not (Strings[i][j] in NumChars))) Do
                    Inc (j);
                  If j <= Length (Strings[i])
                    Then Begin
                      Insert (i + 1, Copy (Strings[i], j, Length (Strings[i]) - j + 1));
                      Strings[i] := Copy (Strings[i], 1, j - 1)
                    End
                End;

              Inc (i)
            End
  End;                       {Function Tokenize}

Function BuildListString (sL : TStringList) : String;
  {Concatenates all of the strings in sL, adding a carriage return character after each one.}
  Var
    i : Integer;
  Begin                      {Function BuildListString}
    Result := '';
    With sL Do
      For i := 0 to Count - 1 Do
        Result := Result + #13
  End;                       {Function BuildListString}

Procedure CleanUpIniSect (sL : TStrings);
  {Strips the IniFile labels from the front of the strings in sL.}
  Var
    i, iPos : Integer;
    S : String;
  Begin                      {Procedure CleanUpIniSect}
    With sL Do
      Try
        BeginUpdate;  // if sL is part of a component, we don't want it to display each change 
        For i := 0 to Count - 1 Do
          Begin
            S := Strings[i];
            iPos := Pos ('=', S);
            If iPos > 0
              Then Strings[i] := Copy (S, iPos + 1, Length (S) - iPos)
          End
      Finally
        EndUpdate
      End
  End;                       {Procedure CleanUpIniSect}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

  Function MatchingKeywords (Const Keys1, Keys2 : String) : Word;
    Var
      i1, i2 : Word;
      List1, List2 : TStringList;

    Function SplitKeywords (Const S : String) : TStringList;
      Var
        i : Integer;
      Begin                  {Function SplitKeywords}
        Result := SplitStr (S, ',');
        With Result Do
          Begin
            For i := 0 to Count - 1 Do
              Strings[i] := Trim (Strings[i]);
            Sort
          End
      End;                   {Function SplitKeywords}

    Begin                    {Function MatchingKeywords}
      Result := 0;
      If (Length (Keys1) > 0) and (Length (Keys2) > 0)
        Then Begin
          {Use Function SplitStr to get TStringLists of the keywords in Keys1 and Keys2.
           Then trim any leading or trailing blanks or control characters and sort the lists.}
          List1 := SplitKeywords (Keys1);
          List2 := SplitKeywords (Keys2);

          {Search for matches in the lists.}
          i1 := 0;  i2 := 0;
          While (i1 < List1.Count) and (i2 < List2.Count) Do
            If List1.Strings[i1] = List2.Strings[i2]
              Then Begin
                Inc (Result);  Inc (i1);  Inc (i2)
              End
              Else If List1.Strings[i1] < List2.Strings[i2]
                Then Inc (i1)
                Else Inc (i2);

          List1.Free;  List2.Free
        End
    End;                     {Function MatchingKeywords}

  Function CountKeywords (Const Keys : String) : Word;
    Var
      List1 : TStringList;
    Begin                    {Function CountKeywords}
      If Length (Keys) = 0
        Then Result := 0
        Else Begin
          {Let Function SplitStr break Keys into a TStringList and just return its count.}
          List1 := SplitStr (Keys, ',');
          Result := List1.Count;
          List1.Free
        End
    End;                     {Function CountKeywords}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

Function CompareStrLists (Const sLstA, sLstB : TStringList) : TStringList;
  Var
    iA, iB, iStrA, iStrB, nSame : Integer;
    StrA, StrB : String;
  Begin                      {Function CompareStrLists}
    Result := TStringList.Create;
    sLstA.Sort;
    sLstB.Sort;

    iA := 0;  iB := 0;
    While (iA < sLstA.Count) and (iB < sLstB.Count) Do
      {If the strings are identical... }
      If sLstA.Strings[iA] = sLstB.Strings[iB]
        Then Begin
          Inc (iA);  Inc (iB)
        End
        Else Begin
          {See if there are just a few changed, inserted, or dropped letters.}
          StrA := sLstA.Strings[iA];
          StrB := sLstB.Strings[iB];
          iStrA := 1;  iStrB := 1;  nSame := 0;
          While (iStrA <= Length (StrA)) and (iStrB <= Length (StrB)) Do
            Begin
              If UpCase (StrA[iStrA]) = UpCase (StrB[iStrB])
                Then Inc (nSame)
                Else If (iStrA < Length (StrA)) and (StrA[iStrA + 1] = StrB[iStrB])
                  Then Begin
                    Inc (iStrA);  Inc (nSame)
                  End
                  Else If (iStrB < Length (StrB)) and (StrB[iStrB + 1] = StrA[iStrA])
                    Then Begin
                      Inc (iStrB);  Inc (nSame)
                    End;
              Inc (iStrA);  Inc (iStrB)
            End;

          If nSame > (Length (StrA) * 2) div 3
            Then Begin
              Result.Add ('Changed  "' + sLstA.Strings[iA] + '" to "' +
                               sLstB.Strings[iB] + '"');
              Inc (iA);  Inc (iB)
            End
            Else If (iB < sLstB.Count) and (sLstB.Strings[iB] < sLstA.Strings[iA])
              Then Begin
                Result.Add ('Added "' + sLstB.Strings[iB] + '"');
                Inc (iB)
              End
              Else Begin
                Result.Add ('Dropped "' + sLstA.Strings[iA] + '"');
                Inc (iA)
              End
        End;

    {If we're not at the end of both lists, we have more work to do.  In other words,
     if iA < sLstA.Count, then we finished looking at the After list before
     the Before list: the user dropped some Before strings.  On the other hand, if
     iB < sLstB.Count, then we finished the Before list before the After list:
     the user added some After strings.}
    While iA < sLstA.Count Do
      Begin
        Result.Add ('Dropped "' + sLstA.Strings[iA] + '"');
        Inc (iA)
      End;
    While iB < sLstB.Count Do
      Begin
        Result.Add ('Added "' + sLstB.Strings[iB] + '"');
        Inc (iB)
      End;
  End;                       {Function CompareStrLists}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

Const
  ValScramble = 2;  ValUnscramble = -ValScramble;
  ScramStr : String[66] = '!YI$1S@J%A6#R^K&H)T2*_Z(0B+L-7Q[X;U,G3=P]W''F.5\8M/O<C:{4E>"N}V9?D|';
  ScramStrLen = 66;
                                                      
Function DoScram (Const S : String; Amt : Integer) : String;
  Var
    i, j : Integer;
  Begin                      {Function DoScram}
    Result := UpCaseStr (S);
    For i := 1 to Length (Result) Do
      Begin
        j := Pos (Result[i], ScramStr);
        If j > 0
          Then Begin
            Inc (j, Amt);
            If j <= 0
              Then Inc (j, ScramStrLen)
              Else If j > ScramStrLen
                Then Dec (j, ScramStrLen)
          End;
        Result[i] := ScramStr[j]
      End
  End;                       {Function DoScram}

Function Scramble (Const S : String) : String;
  Begin
    Result := DoScram (S, ValScramble)
  End;

Function Unscramble (Const S : String) : String;
  Begin
    Result := DoScram (S, ValUnscramble)
  End;

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

Procedure SetAllSelect (LstBx : TListBox);
  Var
    SetSelOn : Boolean;
    i, nSelected : Integer;
  Begin                      {Procedure SetAllSelect}
    With LstBx, Items Do
      Try
        BeginUpdate;  // so the TListBox won't try to display each change in selection

        {See how many of the items are currently selected.}
        i := 0;
        nSelected := 0;
        While i < Count Do
          Begin
            If Selected[i]
              Then Inc (nSelected);
            Inc (i)
          End;

        {If less than all of the items are selected, then select them all.  Otherwise
         (if all are selected), de-select them all.}
        SetSelOn := nSelected < Count;
        For i := 0 to Count - 1 Do
          Selected[i] := SetSelOn
      Finally
        EndUpdate
      End
  End;                       {Procedure SetAllSelect}

Procedure PreSelect (LstBx : TListBox; Const sSel : String);
  {The routine sets LstBx.Selected[n] TRUE for each number (n) in sSel, which is a comma-delimited string
   of numbers.  This procedure is the converse of Function BuildSelectStr.}
  Var
    i : Integer;
  Begin                      {Procedure PreSelect}
    If Length (sSel) = 0
      Then Exit;

    With SplitStr (sSel, ',') Do
      Try
        Try
          {This part is enclosed in a Try ... Except clause because the current list may not have as
           many items as the sSel thinks it has.}
          For i := 0 to Count - 1 Do
            LstBx.Selected[StrToInt (Strings[i])] := TRUE
        Except
        End
      Finally
        Free
      End
  End;                       {Procedure PreSelect}

Function BuildSelectStr (LstBx : TListBox) : String;
  {This routine builds a comma-delimited string of the indexes of selected strings in LstBx.Items.  The
   function is the converse of Procedure PreSelect.}
  Var
    i : Integer;
  Begin                      {Function BuildSelectStr}
    Result := '';
    With LstBx Do
      For i := 0 to Items.Count - 1 Do
        If Selected[i]
          Then Begin
            If Length (Result) > 0
              Then Result := Result + ',';
            Result := Result + IntToStr (i)
          End
  End;                       {Function BuildSelectStr}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

Procedure ClearGrid (grd : TStringGrid);
  Var
    r, c : Integer;
  Begin                      {Procedure ClearGrid}
    With grd Do
      Begin
        {Clear the grid cells, but not any title column or row cells.}
        For r := FixedRows to RowCount - 1 Do
          For c := FixedCols to ColCount - 1 Do
            Cells[c, r] := ''
      End
  End;                       {Procedure ClearGrid}

Procedure InsertGridRow (grd : TStringGrid; AtRow : Integer);
  {Inserts a new blank row into grd by adding a row to the botton of the grid and then
   moving the contents of every cell from row AtRow down one row and blanking out the
   cells of row AtRow.}
  Var
    c, r : Integer;
  Begin                      {Procedure InsertGridRow}
    With grd Do
      Begin
        {Add the new row at the end.}
        RowCount := RowCount + 1;

        {Shift all succeeding rows up one.}
        For r := RowCount - 1 downto AtRow + 1 Do
          For c := 0 to ColCount - 1 Do
            Begin
              Cells[c, r] := Cells[c, r - 1];
              Objects[c, r] := Objects[c, r - 1];
            End;

        {Clear the new row.}
        For c := 0 to ColCount - 1 Do
          Cells[c, AtRow] := ''
     End
  End;                       {Procedure InsertGridRow}

Procedure DropGridRow (grd : TStringGrid; DropRow : Integer);
  {Removes row DropRow from grd by moving the contents of every cell below it up one row,
   and then removing the last row.}
  Var
    c, r : Integer;
  Begin                      {Procedure DropGridRow}
    With grd Do
      If RowCount = 2
        Then ClearGrid (grd)
        Else Begin
          {Shift all succeeding rows up one.}
          For r := DropRow + 1 to RowCount - 1 Do
            For c := 0 to ColCount - 1 Do
              Begin
                Cells[c, r - 1] := Cells[c, r];
                Objects[c, r - 1] := Objects[c, r]
              End;

          {Drop the last row.}
          RowCount := RowCount - 1
        End
  End;                       {Procedure DropGridRow}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

  Function StrToY2KDate (Const S : String) : TDateTime;
    Begin                    {Function StrToY2KDate}
      Result := StrToDate (S);
      If Result < 29221                    //  1/1/1980
        Then Result := Result + 36525      // add a century
    End;                     {Function StrToY2KDate}

  Function DtYear (Dt : TDateTime) : Word;
    Var
      Y, M, D : Word;
    Begin
      DecodeDate (Dt, Y, M, D);
      Result := Y
    End;

  Function DtMonth (Dt : TDateTime) : Word;
    Var
      Y, M, D : Word;
    Begin
      DecodeDate (Dt, Y, M, D);
      Result := M
    End;

  Function DtDay (Dt : TDateTime) : Word;
    Var
      Y, M, D : Word;
    Begin
      DecodeDate (Dt, Y, M, D);
      Result := D
    End;

  Function DtBegMonth (Dt : TDateTime) : TDateTime;
    {Returns the date of the beginning of the month in which Dt occurs.}
    Var
      Y, M, D : Word;
    Begin
      If Dt = 0.0
        Then Result := 0
        Else Begin
          DecodeDate (Dt, Y, M, D);
          Result := StrToDate (IntToStr (M) + '/1/' + IntToStr (Y))
        End
    End;

  Function DtEndMonth (Dt : TDateTime) : TDateTime;
    {Returns the date of the end of the month in which Dt occurs.}
    Var
      Y, M, D : Word;
    Begin                    {Function DtEndMonth}
      If Dt = 0.0
        Then Result := 0
        Else Begin
          DecodeDate (Dt, Y, M, D);

          {Reset Dt to the first day of the next month and then back off one day.}
          Inc (M);
          If M > 12
            Then Begin
              M := 1;
              Inc (Y)
            End;
          Result := DtBegMonth (StrToDate (IntToStr (M) + '/1/' + IntToStr (Y))) - 1.0
        End
    End;                     {Function DtEndMonth}

  Function DtNearestDayOfWeek (Dt : TDateTime; Direction : Real; DayOfWk : Integer) : TDateTime;
    {Returns the date of the nearest DayOfWk day before or after Dt.  If Direction is positive,
     the return value is on or after Dt; if negative, the value is on or before Dt.}
    Begin                    {Function DtNearestDayOfWeek}
      If Direction = 0.0
        Then Result := Dt
        Else Begin
          If Direction < 0.0
            Then Direction := -1.0
            Else Direction := 1.0;
          While DayOfWeek (Dt) <> DayOfWk Do
            Dt := Dt + Direction;
          Result := Dt
        End
    End;                     {Function DtNearestDayOfWeek}

  Function FixDate (Const S : String) : String;
    Var
      sYr : String;
      Dt : TDateTime;
    Begin                    {Function FixDate}
      If (Length (S) > 0) and (Pos ('/', S) = 0)
        Then Begin
          sYr := IntToStr (DtYear (Date));
          Case Length (S) of
            1 : Result := S + '/1/' + sYr;                                        //   1/1/98, 6/1/98, ...

            2 : Case S[1] of
                  '0' : Result := S + '/1/' + sYr;                                //   01/1/98, 09/1/98, ...
                  '1' : If S[2] in ['0'..'2']
                          Then Result := S + '/1/' + sYr                          //   10/1/98, 12/1/98, ...
                          Else Result := '1/' + S[2] + '/' + sYr;                 //   1/01/98, 1/3/98, ...
                  Else  Result := S[1] + '/' + S[2] + '/' + sYr                //   3/2/98, 9/6/98, ...
                End;

            3 : Case S[1] of
                  '0' : Result := Copy (S, 1, 2) + '/' + S[3] + '/' + sYr;     //   01/5/98, 09/6/98, ...
                  '1' : If S[2] in ['0'..'2']
                          Then Result := Copy (S, 1, 2) + '/' + S[3] + '/' + sYr   //   10/1/98, 12/1/98, ...
                          Else Result := '1/' + Copy (S, 2, 2) + '/' + sYr;           //   1/01/98, 1/23/98, ...
                  Else Result := S[1] + '/' + Copy (S, 2, 2) + '/' + sYr       //   3/02/98, 9/26/98, ...
                End;

            4 : Case S[1] of
                  '0' : Result := Copy (S, 1, 2) + '/' + Copy (S, 3, 2) + '/' + sYr;  //   01/05/98, 06/16/98, ...
                  '1' : If S[2] in ['0'..'2']
                          Then Result := Copy (S, 1, 2) + '/' + Copy (S, 3, 2) + '/' + sYr   //   10/1/98, 12/1/98, ...
                          Else Result := '1/' + Copy (S, 2, 2) + '/' + sYr;  // discard S[4]    1/01/98, 1/23/98, ...
                  Else Result := S[1] + '/' + Copy (S, 2, 2) + '/' + sYr  // discard S[4]    3/02/98, 9/26/98, ...
                End;

            5 : Case S[1] of
                  '0' : If S[3] = '0'
                          Then Result := Copy (S, 1, 2) + '/' + Copy (S, 3, 2) + '/' + sYr       // discard S[5]  01/05/98, 06/16/98, ...
                          Else Result := Copy (S, 1, 2) + '/' + S[3] + '/' + Copy (S, 4, 2);  //   01/4/97, 06/6/23, ...
                  '1' : If S[2] in ['0'..'2']
                          Then If S[3] = '0'
                            Then Result := Copy (S, 1, 2) + '/' + Copy (S, 3, 2) + '/' + sYr     // discard S[5]  10/05/98, 12/06/98, ...
                            Else Result := Copy (S, 1, 2) + '/' + S[3] + '/' + Copy (S, 4, 2) //   10/1/97, 12/6/72, ...
                          Else Result := '1/' + Copy (S, 2, 2) + '/' + Copy (S, 4, 2);           //   1/11/97, 1/23/45, ...
                  Else Result := S[1] + '/' + Copy (S, 2, 2) + '/' + Copy (S, 4, 2)           //   3/02/97, 9/18/27, ...
                End;

            Else Result := Copy (S, 1, 2) + '/' + Copy (S, 3, 2) + '/' + Copy (S, 5, 2)
          End;

          {If the resulting date is later than today, back it up one year.}
          Dt := StrToDate (Result);
          If Dt > Date
            Then Begin
              Result := DateToStr (IncMonth (Dt, -12))
            End
        End
        Else Result := S
    End;                     {Function FixDate}

  Procedure Delay (nSecs : Word);
    {Repeatedly calls the system date-time function to accumulate nSecs of delay.}
    Const
      SecPartOfDay = 1.0 / (24.0 * 60.0 * 60.0);
    Var
      HoldScrnCursor : TCursor;
      StartTime : TDateTime;
    Begin                    {Procedure Delay}
      HoldScrnCursor := Screen.Cursor;
      Screen.Cursor := crHourglass;
      Application.ProcessMessages;

      StartTime := Now;
      Repeat
      Until Now - StartTime >= nSecs * SecPartOfDay;

      Screen.Cursor := HoldScrnCursor;
      Application.ProcessMessages
    End;                     {Procedure Delay}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

  Function MaxReal (V1, V2 : Real) : Real;
    Begin
      If V1 > V2
        Then Result := V1
        Else Result := V2
    End;

  Function MinReal (V1, V2 : Real) : Real;
    Begin
      If V1 < V2
        Then Result := V1
        Else Result := V2
    End;

  Function MaxInt (V1, V2 : LongInt) : LongInt;
    Begin
      If V1 > V2
        Then Result := V1
        Else Result := V2
    End;

  Function MinInt (V1, V2 : LongInt) : LongInt;
    Begin
      If V1 < V2
        Then Result := V1
        Else Result := V2
    End;

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

  Function VarEqual (Var V1, V2; nBytes : Word) : Boolean;
    {Returns TRUE if the first nBytes bytes starting at V1 are equal to those at V2.}
    Var
      i : Word;
      Var1 : Array [0..65535] of Byte absolute V1;
      Var2 : Array [0..65535] of Byte absolute V2;
    Begin                    {Function VarEqual}
      i := 0;
      While (i < nBytes) and (Var1[i] = Var2[i]) Do
        Inc (i);
      Result := i = nBytes
    End;                     {Function VarEqual}


  Function VarEquiv (Var V1, V2; nBytes : Word) : Boolean;
    {Returns TRUE if the first nBytes bytes starting at V1 are equivalent to those at V2.
     This function differs from VarEqual in that here #0 and #32 (null and blank) are
     considered equivalent.}
    Var
      i : Word;
      Var1 : Array [0..65535] of Byte absolute V1;
      Var2 : Array [0..65535] of Byte absolute V2;
    Begin                    {Function VarEquiv}
      i := 0;
      While (i < nBytes) and
            ((Var1[i] = Var2[i]) or ((Var1[i] in [0, 32]) and (Var2[i] in [0, 32]))) Do
        Inc (i);
      Result := i = nBytes
    End;                     {Function VarEquiv}


  Function VarLessThan (Var V1, V2; nBytes : Word) : Boolean;
    {Returns TRUE if nBytes bytes starting at V1 are less than those at V2.}
    Var
      i : Word;
      Var1 : Array [0..65535] of Byte absolute V1;
      Var2 : Array [0..65535] of Byte absolute V2;
    Begin                    {Function VarLessThan}
      i := 0;
      While (i < nBytes) and (Var1[i] = Var2[i]) Do
        Inc (i);
      Result := (i < nBytes) and (Var1[i] < Var2[i])
    End;                     {Function VarLessThan}


  Function VarEmpty (Var V1; nBytes : Word) : Boolean;
    {Returns TRUE if the first nBytes bytes starting at V1 are either blank or null.}
    Var
      i : Word;
      Var1 : Array [0..65535] of Byte absolute V1;
    Begin                    {Function VarEmpty}
      i := 0;
      While (i < nBytes) and (Var1[i] in [0, 32]) Do
        Inc (i);
      Result := i = nBytes
    End;                     {Function VarEmpty}


  Function VarNull (Var V1; nBytes : Word) : Boolean;
    {Returns TRUE if the first nBytes bytes starting at V1 are null.}
    Var
      i : Word;
      Var1 : Array [0..65535] of Byte absolute V1;
    Begin                    {Function VarNull}
      i := 0;
      While (i < nBytes) and (Var1[i] = 0) Do
        Inc (i);
      Result := i = nBytes
    End;                     {Function VarNull}

  Procedure SwapVars (Var Val1, Val2; ValLen : Word);
    {Moves Val1 to Val2 and vice versa.}
    Var
      p : Pointer;
    Begin                    {Procedure SwapVars}
      GetMem (p, ValLen);
      Move (Val1, p^, ValLen);
      Move (Val2, Val1, ValLen);
      Move (p^, Val2, ValLen);
      FreeMem (p, ValLen)
    End;                     {Procedure SwapVars}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

  Function IniFName (Const fName : String) : String;
    Begin                    {Function IniFName}
      Result := Application.ExeName;
      If Length (fName) = 0
        Then Result := Copy (Result, 1, Length (Result) - 4)
        Else If Pos ('\', fName) = 0
          Then Result := ExtractFilePath (Result) + fName
          Else Result := fName;
      Result := Result + '.ini'
    End;                     {Function IniFName}

  Function IniFName : String;
    Begin
      Result := IniFName ('')
    End;

  Function GetFileSize (Const FName : String) : LongInt;
    Var
      Srch : TSearchRec;
    Begin                    {Function GetFileSize}
      If FindFirst (FName, faAnyFile, Srch) = 0
        Then Result := Srch.Size
        Else Result := -1;
      FindClose (Srch)
    End;                    {Function GetFileSize}

  Procedure EraseFile (Const FName : String);
    Var                      {Procedure EraseFile}
      F : System.Text;
    Begin
      Try
        AssignFile (F, FName);
        Erase (F)
      Except
        MessageDlg ('Unable to erase file "' + FName + '".', mtError, [mbOK], 0)
      End
    End;                     {Procedure EraseFile}

  Function FExtFromDate : String;
    {Returns a 4-character string with a filename extension created from the current
     system date.  The first character is a '.'.  Next come the last digit of the
     year, and characters or digits representing the month and day.  Months January
     through September are shown as '1' through '9', with October through December
     listed as 'A' through 'C'.  Similarly, day numbers are '1' through '9' and
     'A' through 'V'.}
    Const
      MonChar : String[12] = '123456789ABC';
      DayChar : String[31] = '123456789ABCDEFGHIJKLMNOPQRSTUV';
    Var
      Y, M, D : Word;
      S : String;
    Begin                    {Function FExtFromDate}
      DecodeDate (Date, Y, M, D);
      Str (Y:4, S);
      Result := '.' + S[4] + MonChar[M] + DayChar[D]
    End;                     {Function FExtFromDate}

  Function IsHTML (Const FName : String) : Boolean;
    Var
      sFstLine : String;
      F : Text;
    Begin                    {Function IsHTML}
      Try
        AssignFile (F, FName);
        Reset (F);
        sFstLine := '';
        Repeat
          Readln (F, sFstLine);
          sFstLine := Trim (sFstLine)
        Until EOF (F) or (Length (sFstLine) > 0);
        CloseFile (F);

        Result := (Length (sFstLine) > 0) and
                  ((UpperCase (Copy (sFstLine, 1, 6)) = '<HTML>') or
                   (UpperCase (Copy (sFstLine, 1, 4)) = '<!--') or
                   (UpperCase (Copy (sFstLine, 1, 9)) = '<COMMENT>'))
      Except
        Result := FALSE
      End
    End;                     {Function IsHTML}

End.
