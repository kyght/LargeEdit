
//***** LargeEdit Scripting *****
//
// Title:
// Author:
// Date:
// Purpose:
//
//*******************************

function Run() {
    LargeEdit.ResultLog(' Regular Expression Search');

    var inpStr = LargeEdit.CurrentFile.Text;

//    interface ILargeEditor : IDispatch {
//        HRESULT CaretX([out, retval] long* Value);
//        [id(0x00000002), propput]

    var oRe;
    //oRe = new RegExp("HRESULT\\s(\\w+)\\x28(.*)\\x29", "g"); //matches on single line funtions
    oRe = new RegExp("HRESULT\\s(\\w+)\\x28([^\\x29]*)", "g"); //Try multi and single line matches
    
    //oRe = new RegExp("interface\\s(\\w+)\\s:\\sIDispatch\\s\\x7B([^\x7D]*)", "gmi"); //Get all interface declears
    // Look for an e-mail address (not a perfect RegExp)
    // Get the Matches collection
    var arr;
    var retStr = '';
    while ((arr = oRe.exec(inpStr)) != null) {
      retStr += arr.index + "-" + arr.lastIndex + '\t' + arr;
      LargeEdit.ResultLog(retStr);
      retStr = '';
    }

}

//copyright 2005 All rights reserved
