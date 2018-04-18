VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ComplexAction"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Implements ILEAction

Private fLEEdit As LargeEditor


Public Sub ILEAction_Init(ByVal LEdit As LargeEditor)
    Set fLEEdit = LEdit
End Sub

Public Sub ILEAction_OnClick(ByVal menuname As String)
  If LCase(menuname) = "capitalize" Then
    fLEEdit.SelectedText = StrConv(fLEEdit.SelectedText, vbProperCase)
  ElseIf LCase(menuname) = "word count" Then
    Dim cnt
    If Len(fLEEdit.SelectedText) > 0 Then
      MsgBox "The selected text contains " & GetWordCount(fLEEdit.SelectedText) & " words.", vbOKOnly, "Word Count"
    Else
      MsgBox "This document contains " & GetWordCount(fLEEdit.CurrentFile.Text) & " words.", vbOKOnly, "Word Count"
    End If
  Else
    MsgBox "This selected function of not a member of this plugin (" & menuname & ")", vbOKOnly, "LargeAction Plugin"
  End If
End Sub

Private Function GetWordCount(strInput)
  Dim strTemp

  ' Deal with tabs and carriage returns
  ' by replacing them with spaces.
  strTemp = Replace(strInput, vbTab, " ")
  strTemp = Replace(strTemp, vbCr, " ")
  strTemp = Replace(strTemp, vbLf, " ")

  ' Remove leading and trailing spaces
  strTemp = Trim(strTemp)

  ' Combine multiple spaces down to single ones
  Do While InStr(1, strTemp, "  ", 1) <> 0
    strTemp = Replace(strTemp, "  ", " ")
  Loop

  ' Get a count by splitting the string into an array
  ' and retreiving the number of elements in it.
  ' I add one to deal with the 0 lower bound.
  GetWordCount = UBound(Split(strTemp, " ", -1, 1)) + 1

End Function ' GetWordCount

