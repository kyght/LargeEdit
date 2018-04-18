//***** LargeEdit Scripting *****
//
// Title:  Type Library to HTML Table
// Author: Tim O'Brien
// Date:  April 7, 2006
// Purpose: Parse type library and convert into a stuctured HTML table.
//          This function allows software developers who create type libraries
//          to quickly generate basic documentation structure.
//*******************************
//  Unused Expressions
//oRe = new RegExp("HRESULT\\s(\\w+)\\x28(.*)\\x29", "g"); //Get function matches on single line funtions
//************
function Run() {
    LargeEdit.ResultLog(' Type Library Scan ');

    var inpStr = LargeEdit.CurrentFile.Text; //Get text

    var oRe, oReint;
    //Get all interface declears and bodies
    oReint = new RegExp("interface\\s(\\w+)\\s:\\sIDispatch\\s\\x7B([^\x7D]*)", "gmi");
    //Get all methods
    oRe = new RegExp("HRESULT\\s(\\w+)\\x28([^\\x29]*)", "g");

    // Get the Matches collection
    var intfaces;
    var methods;
    var inftxt;
    var retStr = '';
    var outhtml = '<table width="60%">\n';
    while ((intfaces = oReint.exec(inpStr)) != null) {
      inftxt = intfaces[2]; //This is the interface name
      
      outhtml += '\t<tr>\n';
      outhtml += '\t\t<th style="font-weight:bold">\n';
      outhtml += '\t\t\t' + intfaces[1] + '\n';
      outhtml += '\t\t</th>\n';
      outhtml += '\t</tr>\n';
      
      //retStr = intfaces.index + "-" + intfaces.lastIndex + '\t' + intfaces[1];
      //LargeEdit.ResultLog(retStr);

      while ((methods = oRe.exec(inftxt)) != null) {
      outhtml += '\t<tr>\n';
        outhtml += '\t\t<td style="padding-left: 20px">\n';
        //retStr = '\t\t' + methods[1]; //This is the method name
        outhtml += '\t\t\t' + methods[1] + '\n';
        outhtml += '\t\t</td>\n';
        //LargeEdit.ResultLog(retStr);
      outhtml += '\t</tr>\n';
      }
      
      //retStr = '';
    }
    outhtml += '</table>\n';
    LargeEdit.New();
    LargeEdit.SelectedText = outhtml;
    LargeEdit.ResultLog(outhtml);
}

//copyright 2005 All rights reserved
