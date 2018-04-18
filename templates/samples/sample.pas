function getsample(code: String): boolean;
var
  i: integer;
  const codes: array[0..2] of string = ('1','2','3');
begin
  //Get Sample Pascal
  for i := low(codes) to high(codes) do begin
    if codes[i] = code then
      result := true;
  end;
end;