//***** LargeEdit Scripting *****
//
// Title:  Type Library to List
// Author: Tim O'Brien
// Date:  April 7, 2006
// Purpose: Parse type library and convert into a list of methods
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
    var outhtml = '';
    var meth;
    while ((intfaces = oReint.exec(inpStr)) != null) {
      inftxt = intfaces[2]; //This is the interface name
      
      //outhtml += '\t<h4>';
      outhtml += intfaces[1] + '\n';
      //outhtml += '</h4>\n';
      
      //retStr = intfaces.index + "-" + intfaces.lastIndex + '\t' + intfaces[1];
      //LargeEdit.ResultLog(retStr);
      //outhtml += '\t<p style="margin-left: 2em;">\n';
      //outhtml += '\t\t<ul>\n';
      while ((methods = oRe.exec(inftxt)) != null) {
        meth = methods[1] + methods[2];
        //outhtml += '\t\t\t' + '<li><a href="' + meth.toLowerCase() + '.html">' + meth + '</a></li>\n';
        outhtml += meth + '\n';
      }
      
      //outhtml += '\t\t</ul>\n'
      //outhtml += '\t</p>';
      
      //retStr = '';
    }
    LargeEdit.New();
    LargeEdit.SelectedText = outhtml;
    LargeEdit.ResultLog(outhtml);
}

/*
   <h4>LargeEditor Object</h4>
   <p class="tab">
      Properties
  		<table>
  		<tr><td>
  				<ul>
  					<li><a href="intro.html">ShowHelp</a></li>
  					<li><a href="using.html">Using LargeEdit</a></li>
  				</ul>			
  		</td></tr>
  		</table>
      Methods
  		<table>
  		<tr><td>
  				<ul>
  					<li><a href="intro.html">Introducing LargeEdit</a></li>
  					<li><a href="using.html">Using LargeEdit</a></li>
  				</ul>			
  		</td></tr>
  		</table>  		
   </p>
   */

//copyright 2005 All rights reserved
