//Help on Demand System

uses system;

interface

  THelpItem = class
  private
    Fxnode: IXMLDOMNode;
  public
    constructor Create(xnode: IXMLDOMNode);
  end;

  THelpDemand = class
  private
    xmlhttp: IXMLHTTP;
    xdoc: IXMLDOMDocument;
    FPage: string;
    FBaseUrl: string;
    FLastError: boolean;
    function Download: boolean;
    function Search: boolean;
    function GetHelpItem(index: integer): THelpItem;
    function GetCount: integer;
  protected
  public
    constructor Create;
    procedure CheckForHelp( language, keyword );
    property BaseUrl: string read FBaseUrl write FBaseUrl;
    property Items[index: integer]: THelpItem read GetHelpItem;
    property Count: integer read GetCount;
  end;


implementation

const csPage = 'helpconfig.asp';

{ THelpItem }

constructor THelpItem.Create(xnode: IXMLDOMNode)
begin
  Fxnode := xnode;
end;


{ THelpDemand }

constructor THelpDemand.Create
begin
  FPage = csPage;
end;

function THelpDemand.GetHelpItem( index: integer ): THelpItem
var
  xnode: IXMLDOMNode;
  hlpitem: THelpItem;
begin
  //GetHelp Item at index
  xnode := xdoc.documentElement.childNodes.items(index);
  if xnode then begin
    hlpitem := THelpItem.Create(xnode);
    result := hlpitem;
  end;
end;

function GetCount: integer
begin
  result := xdoc.documentElement.childNodes.length;
end;

function THelpDemand.Search( lang: String; keyword: string): boolean
begin
  //Search for help for a language and keyword
  FPage := csPage + 'lang=' + lang + ';keyword=' + keyword;
  if not Download then exit;
end;

function THelpDemand.Download: boolean
begin
  //Load page from internet
  xmlhttp := XMLHTTP.Create();
  xmlhttp.Open("GET", FBaseUrl + FPage, false);
	xmlhttp.Send();
	if (xmlhttp.responseXML.parseError.errorCode != 0) begin
		FLastError = xmlhttp.responseXML.parseError;
		result := false
	end
  else begin
    xdoc := xmlhttp.responseXML;
    result := true;
	end;
end;

procedure THelpDemand.CheckForHelp( language, keyword )
begin
  {Check internet for help on this language and keyword
  If help exists, get details. If multiple help locations then
  display (Name, Source) list options.
    If source is website, then open in browser or preview window(to be done)
    If source is file, then download help file(.chm,.hlp) to help folder and link to language.
  }
  if not Search then exit;
  
end;

end.
