//***** LargeEdit Scripting *****
//
// Title:
// Author:
// Date:
// Purpose:
//
//*******************************

function Run() {
    LargeEdit.ResultLog(' URL Scan ');
  
    var inpStr = LargeEdit.CurrentFile.Text;
  
    var oRe, oMatch, oMatches
    oRe = new RegExp("www\\x2e(\\w+)\\x2e", "g");
    // Look for an e-mail address (not a perfect RegExp)
    // Get the Matches collection
    var arr;
    var retStr = '';
    while ((arr = oRe.exec(inpStr)) != null) {
      LargeEdit.ResultLog(arr.index + "-" + arr.lastIndex + "\t" + arr);
    }

}

//copyright 2005 All rights reserved
