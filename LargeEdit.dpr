program LargeEdit;

uses
  Forms,
  fLargePad in 'fLargePad.pas' {fLEdit},
  foptions in 'foptions.pas' {fopts},
  dialogDefField in 'dialogDefField.pas' {dlgDelField},
  unitUtils in 'unitUtils.pas',
  dlgProcessing in 'dlgProcessing.pas' {dlgProcess},
  winmacro in 'winmacro.pas',
  dlgHightlightEdit in 'dlgHightlightEdit.pas' {dlgHighlightEditor},
  frmPrintPreviewHex in 'frmPrintPreviewHex.pas' {fPrintPreHex},
  mapimail in 'mapimail.pas',
  dlgAboutLE in 'dlgAboutLE.pas' {dlgAbout},
  rsFileVersion in 'rsFileVersion.pas',
  dlgStandard in 'dlgStandard.pas' {dStandard},
  dlgEditCodeCompletion in 'dlgEditCodeCompletion.pas' {dEditComplete},
  unitCompProposalFile in 'unitCompProposalFile.pas',
  unitFileAssoc in 'unitFileAssoc.pas',
  unitRecentDocs in 'unitRecentDocs.pas',
  unitRecentAppDocs in 'unitRecentAppDocs.pas',
  dlgSpellCheck in 'dlgSpellCheck.pas' {dSpellCheck},
  dlgSpelling in 'dlgSpelling.pas' {dSpellingOptions},
  dlgFindReplace in 'dlgFindReplace.pas' {dFindReplace},
  dlgFileList in 'dlgFileList.pas' {dFileList},
  dlgSelectList in 'dlgSelectList.pas' {dSelectList},
  dlgStandardTool in 'dlgStandardTool.pas' {dStandardTool},
  dlgTextGrid in 'dlgTextGrid.pas' {dTextGrid},
  dlgViewGrid in 'dlgViewGrid.pas' {dViewGrid},
  dlgNagScreen in 'dlgNagScreen.pas' {dlgNag},
  unitHelpConstants in 'unitHelpConstants.pas',
  unitAppConst in 'unitAppConst.pas',
  dlgCodeViewer in 'dlgCodeViewer.pas' {dCodeViewer},
  dlgColorHex in 'dlgColorHex.pas' {dHexColor},
  dlgMonthCal in 'dlgMonthCal.pas' {dMonCal},
  frmCatalog in 'frmCatalog.pas' {fSQLCata},
  dlgLargeTxt in 'dlgLargeTxt.pas' {frmLargeTEXT},
  dlgFTPSaveOpen in 'dlgFTPSaveOpen.pas' {dFTPso},
  unitDataUtils in 'unitDataUtils.pas',
  dialogRowSelect in 'dialogRowSelect.pas',
  frmHexEditor in 'frmHexEditor.pas' {fHexEdit},
  frmPrintPreview in 'frmPrintPreview.pas' {fPrintPre},
  dlgResultTool in 'dlgResultTool.pas' {dResultTool},
  frmMacroCatalog in 'frmMacroCatalog.pas' {fMacCat},
  LargeEdit_TLB in 'LargeEdit_TLB.pas',
  autoLargeEdit in 'autoLargeEdit.pas' {LargeEditor: CoClass},
  frmProjectWin in 'frmProjectWin.pas' {fProject},
  frmImages in 'frmImages.pas' {frmLEImages},
  unitLargeFiles in 'unitLargeFiles.pas',
  unitProject in 'unitProject.pas',
  unitxobject in 'unitxobject.pas',
  unitNSProj in 'unitNSProj.pas',
  autoLargeFile in 'autoLargeFile.pas' {LargeFile: CoClass},
  frmWebBrowser in 'frmWebBrowser.pas' {fWebBrowser},
  dlgTemplate in 'dlgTemplate.pas' {dtempwin},
  dlgOLEPlugin in 'dlgOLEPlugin.pas' {doleplugin},
  frmExplorer in 'frmExplorer.pas' {fexplorer},
  unitNSToolbars in 'unitNSToolbars.pas',
  dlgSearchText in 'dlgSearchText.pas' {TextSearchDialog},
  dlgReplaceText in 'dlgReplaceText.pas' {TextReplaceDialog},
  dlgConfirmReplace in 'dlgConfirmReplace.pas' {ConfirmReplaceDialog},
  dlgToolButton in 'dlgToolButton.pas' {dToolbarBtn},
  dlgToolbar in 'dlgToolbar.pas' {dToolBar},
  dlgManageList in 'dlgManageList.pas' {dManageList},
  ftpparseheader in 'ftpparseheader.pas',
  ftpparse in 'ftpparse.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Large Edit';
  fopts := Tfopts.Create(Application);
  Application.CreateForm(TfLEdit, fLEdit);
  Application.CreateForm(TfPrintPreHex, fPrintPreHex);
  Application.CreateForm(TfPrintPre, fPrintPre);
  Application.CreateForm(TdFileList, dFileList);
  Application.CreateForm(TdTextGrid, dTextGrid);
  Application.CreateForm(TdlgAbout, dlgAbout);
  Application.CreateForm(TdlgNag, dlgNag);
  Application.CreateForm(TfSQLCata, fSQLCata);
  Application.CreateForm(TdResultTool, dResultTool);
  Application.CreateForm(TfMacCat, fMacCat);
  Application.CreateForm(TfrmLEImages, frmLEImages);
  Application.CreateForm(Tfexplorer, fexplorer);
  Application.CreateForm(TConfirmReplaceDialog, ConfirmReplaceDialog);
  Application.Run;
end.
