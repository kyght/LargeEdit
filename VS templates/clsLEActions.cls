VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ActionClass"
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
  If LCase(menuname) = "menu description" Then
    
  Else
    MsgBox "This selected function of not a member of this plugin (" & menuname & ")", vbOKOnly, "LargeAction Plugin"
  End If
End Sub

