<?xml version="1.0" encoding='windows-1252'?>
<xsl:stylesheet version="1.0"
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:html='http://www.w3.org/tr/rec-html40'
  xmlns:msxsl='urn:schemas-microsoft-com:xslt'
  xmlns:rs='urn:schemas-microsoft-com:rowset'
  xmlns:z='#RowsetSchema'
  xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
	xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'>

  <xsl:template match="/">
    <html>
    <head>
          <title>LargeEdit - ADO(XML) to HTML</title>
    </head>
    <style><![CDATA[
			.gridtable {
			  padding: 0 0 0 0;
			  margin: 0 0 0 0;
			  border: 1px, solid, black;
			  width: 100%;
			  background-color: #D5D5D0;
			}

			.gridheaders {
			  padding: 0 0 0 0;
			  margin: 0 0 0 0;
			}
			
			.gridheadercell {
			  padding: 0 0 0 0;
			  margin: 0 0 0 0;
			  Font-FAMILY: 'MS Sans Serif';
			  font-size: 12px;
			  font-weight: bold;
			  text-transform: capitalize;
			  border-left: thin solid #EBEBEB;
			  border-top: thin solid #EBEBEB;
			  border-right: thin solid #969696;
			  border-bottom: 1px solid black;
			  text-align: center;
			  white-space: nowrap;
			  background-color: #D5D5D0;
			}
			
			.gridrow {
			  padding: 0 0 0 0;
			  margin: 0 0 0 0;
			}
			
			.gridcell {
			  padding: 0 0 0 0;
			  margin: 0 0 0 0;
			  text-align:left;
			  background-color: white;
			}

    ]]>
    </style>
    <body>

    		 <H2>LargeEdit - ADO(XML) to HTML</H2>

         <DIV ID="GridContents" class="GridContainer">

              <!-- START SubGrid -->
              <table class="gridtable" border="1" cellpadding="0" cellspacing="0">
              <TR class="gridheaders">
                  <xsl:for-each select="//s:Schema/s:ElementType/s:AttributeType">
                    <TD class="gridheadercell">
                        <xsl:value-of select="@name" />
                    </TD>
                  </xsl:for-each>
              </TR>

              <xsl:for-each select="//rs:data/z:row">
              <TR class="gridrow">
                  <xsl:for-each select="./@*">
                  <TD class="gridcell">
                  		<xsl:value-of select="." />
                  </TD>
                  </xsl:for-each>
              </TR>
              </xsl:for-each>


              </table>
              <!-- END SubGrid -->

          </DIV>

    </body>
    </html>
  </xsl:template>


</xsl:stylesheet>
