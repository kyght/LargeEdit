function getsample(code)
  'Get Sample VBScript

  dim codes
  dim i
  codes = Array("1","2","3")
  for i = LBound(codes) to UBound(codes) 
    if codes[i] = code then
	getsample = true
    end if
  next
end function