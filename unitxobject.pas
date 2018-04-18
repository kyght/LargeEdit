unit unitxobject;

interface

uses msxml2_tlb, comobj;

type
  TXClass = class of TXObject;

  TXObject = class(TTypedComObject)
  private
    xdoc: IXMLDOMDocument;
    FCurNode: IXMLDOMNode;
    FXClass: TXClass;
    function GetXObject(index: integer): TXObject;
    function GetNodeValue(index: integer): string;
    function GetPropertyValue(index: integer): string;
    function GetParentNode: TXObject;
    function GetNodeObject(index: integer): TXObject;
    function GetInnerText: String;
    function GetPropertyNameValue(index: String): string;
    //function PropertyByName(name: string): string;
    procedure SetPropertyNameValue(index: String; const Value: string);
  protected
  public
    constructor Create; overload;
    constructor Create(rootnode: string); overload;
    constructor Create(node: IXMLDOMNode); overload;
    //Serialize/Deserialize
    function LoadXML( xml: string ): boolean;
    function Load( filename: string ): boolean;
    function Save( filename: string ): boolean;

    //Adds
    function AddObject(name: string): TXObject;
    procedure AddNode(name, value: string);
    procedure AddProperty(name, value: string);

    //Exists and Sets
    function NodeExists(name: string): boolean;
    function ObjectExists(name: string): boolean;
    procedure SetNode(name, value: string);
    procedure SetValue(value: string);
    procedure SetData(data: string);
    procedure ExchangeNodes( first: TXobject; second: TXObject; backward: boolean = true);

    //Searches
    function ObjectByNamedIndex(name: string; index: integer): TXobject;
    function ObjectByName(name: string): TXobject;
    function NodeByName(name: string): string;
    //function PropertyByName(name: string): string;

    //Deletes
    procedure RemoveNode(name: string);
    procedure Delete;

    //Loop access
    function ObjectCount: integer;
    function NodeCount: integer;
    function PropertyCount: integer;

    property Objects[index: integer]: TXObject read GetXObject;
    property Nodes[index: integer]: string read GetNodeValue;
    property NodeObject[index: integer]: TXObject read GetNodeObject;
    property Properties[index: integer]: string read GetPropertyValue;
    property PropertyByName[index: String]: string read GetPropertyNameValue write SetPropertyNameValue;

    property InnerText: String read GetInnerText;
    property CurrentNode: IXMLDOMNode read FCurNode;
    property ParentNode: TXObject read GetParentNode;
    property BaseClass: TXClass read FXClass write FXClass;
  end;

implementation

uses variants;

{ TXObject }

procedure TXObject.AddNode(name, value: string);
var
  ele: IXMLDOMElement;
begin
  ele := xdoc.createElement(name);
  ele.text := value;
  FCurNode.appendChild(ele);
end;

function TXObject.AddObject(name: string): TXObject;
var
  ele: IXMLDOMElement;
begin
  ele := xdoc.createElement(name);
  FCurNode.appendChild(ele);
  result := TXObject.Create(ele);
end;

constructor TXObject.Create;
begin
  xdoc := CoDOMDocument.Create;
  xdoc.loadXML('<xobject/>');
  FCurNode := xdoc.documentElement;
end;

procedure TXObject.AddProperty(name, value: string);
var
  att: IXMLDOMAttribute;
begin
  att := xdoc.createAttribute(name);
  att.text := value;
  FCurNode.attributes.setNamedItem(att);
end;

constructor TXObject.Create(node: IXMLDOMNode);
begin
  xdoc := node.ownerDocument;
  FCurNode := node;
end;

function TXObject.Load(filename: string): boolean;
begin
  result := xdoc.load(filename);
  if result then begin
    result := assigned(xdoc.documentElement);
    FCurNode := xdoc.documentElement;
  end;
end;

function TXObject.LoadXML(xml: string): boolean;
begin
  result := xdoc.loadXML(xml);
  if result then begin
    result := assigned(xdoc.documentElement);
    FCurNode := xdoc.documentElement;
  end;
end;

function TXObject.ObjectCount: integer;
var
  i: integer;
begin
  result := 0;
  for i := 0 to FCurNode.childNodes.length -1 do
    if FCurNode.childNodes.item[i].hasChildNodes then
      result := result + 1;
end;

function TXObject.NodeCount: integer;
begin
  result := FCurNode.childNodes.length;
end;

function TXObject.PropertyCount: integer;
begin
  result := FCurNode.attributes.length;
end;

function TXObject.GetXObject(index: integer): TXObject;
var
  i: integer;
  cnt: integer;
begin
  result := nil;
  cnt := 0;
  for i := 0 to FCurNode.childNodes.length -1 do begin
    if FCurNode.childNodes.item[i].hasChildNodes then begin
      if cnt = index then begin
        result := FXClass.Create(FCurNode.childNodes.item[i]);
        exit;
      end;
      cnt := cnt + 1;
    end;
  end;
end;

function TXObject.GetNodeValue(index: integer): string;
var
  i: integer;
  cnt: integer;
begin
  result := '';
  cnt := 0;
  for i := 0 to FCurNode.childNodes.length -1 do begin
    if FCurNode.childNodes.item[i].hasChildNodes then begin
      if cnt = index then begin
        result := FCurNode.childNodes.item[i].text;
        exit;
      end;
      cnt := cnt + 1;
    end;
  end;
end;

function TXObject.GetPropertyValue(index: integer): string;
begin
  result := FCurNode.attributes.item[index].text;
end;

function TXObject.ObjectByNamedIndex(name: string;
  index: integer): TXobject;
var
  xnodes: IXMLDOMNodeList;
begin
  result := nil;
  xnodes := FCurNode.selectNodes(name);
  if index < xnodes.length then begin
    result := TXObject.Create(xnodes.item[index]);
  end;
end;

function TXObject.NodeByName(name: string): string;
var
  xnode: IXMLDOMNode;
begin
  result := '';
  xnode := FCurNode.selectSingleNode(name);
  if assigned(xnode) then
    result := xnode.text;
end;

{function TXObject.PropertyByName(name: string): string;
var
  xnode: IXMLDOMNode;
begin
  result := '';
  xnode := FCurNode.attributes.getNamedItem(name);
  if assigned(xnode) then
    result := xnode.text;
end;}

function TXObject.Save(filename: string): boolean;
begin
  xdoc.save(filename);
  result := true;
end;

function TXObject.NodeExists(name: string): boolean;
begin
  result := assigned(FCurNode.selectSingleNode(name));
end;

procedure TXObject.SetNode(name, value: string);
begin
  if NodeExists(name) then
    FCurNode.selectSingleNode(name).text := value
  else
    AddNode(name, value);
end;

function TXObject.ObjectByName(name: string): TXobject;
begin
  result := nil;
  if ObjectExists(name) then
    result := TXObject.Create( FCurNode.selectSingleNode(name) );
end;

function TXObject.ObjectExists(name: string): boolean;
begin
  result := assigned(FCurNode.selectSingleNode(name));
end;

procedure TXObject.RemoveNode(name: string);
begin
  if (ObjectExists(name)) then
    FCurNode.removeChild(FCurNode.selectSingleNode(name));
end;

procedure TXObject.SetValue(value: string);
begin
  FCurNode.text := value;
end;

procedure TXObject.Delete;
var
  pnode: IXMLDOMNode;
begin
  pnode := FCurNode.parentNode;
  pnode.removeChild(FCurNode);
end;

function TXObject.GetParentNode: TXObject;
begin
  result := TXObject.Create( FCurNode.parentNode );
end;

function TXObject.GetNodeObject(index: integer): TXObject;
begin
  result := nil;
  if index < FCurNode.childNodes.length then
    result := TXObject.Create(FCurNode.childNodes.item[index]);
end;

function TXObject.GetInnerText: String;
begin
  result := FCurNode.text;
end;

function TXObject.GetPropertyNameValue(index: String): string;
var
  xnode: IXMLDOMNode;
begin
  result := '';
  xnode := FCurNode.attributes.getNamedItem(index);
  if assigned(xnode) then
    result := xnode.text;
end;

procedure TXObject.SetPropertyNameValue(index: String;
  const Value: string);
var
  xnode: IXMLDOMNode;
begin
  xnode := FCurNode.attributes.getNamedItem(index);
  if not(assigned(xnode)) then begin
    xnode := xdoc.createAttribute(index);
    xnode := FCurNode.attributes.setNamedItem(xnode);
    end;

  if assigned(xnode) then
    xnode.text := Value;
end;

procedure TXObject.SetData(data: string);
var
  cdte: IXMLDOMCDATASection;
begin
  if (FCurNode.childNodes.length > 0) and (FCurNode.childNodes.item[0].nodeTypeString = 'cdatasection') then
    FCurNode.childNodes.item[0].text := data
  else begin
    cdte := xdoc.createCDATASection(data);
    FCurNode.appendChild(cdte);
  end;
end;

procedure TXObject.ExchangeNodes(first, second: TXObject; backward: boolean);
begin
  FCurNode.removeChild(first.CurrentNode);
  if backward then
    FCurNode.insertBefore(first.CurrentNode, second.CurrentNode.nextSibling)
  else
    FCurNode.insertBefore(first.CurrentNode, second.CurrentNode);
end;

constructor TXObject.Create(rootnode: string);
begin
  xdoc := CoDOMDocument.Create;
  xdoc.loadXML('<' + rootnode + '/>');
  FCurNode := xdoc.documentElement;
end;

end.
