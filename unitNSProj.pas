unit unitNSProj;

interface

uses unitProject, unitxobject, classes, comobj, msxml2_tlb;

type
  TNSProjectItem = class;

  TNSProjectGroup = class(TAutoObject, IProjectGroup)
  private
    FPrjGrp: TXObject;
    FProjects: TStringList;
    FProjectFile: String;
    function ObjectCreated(name: string): boolean;
    function ObjectByName(name: string): TNSProjectItem;
    procedure AddItem(parentitem: IProjectItem; item: IXMLDOMNode);
    procedure Cleanup;
  protected
  public
    constructor Create;
    destructor Destroy;
    function AddProject(name: string): IProjectItem; stdcall;
    procedure RemoveProject(name: string); stdcall;
    function FindProject(projectname: string): IProjectItem; stdcall;
    function LoadProject(filename: string): boolean; stdcall;
    function SaveProject(filename: string): boolean; stdcall;
    function Projects(index: integer): IProjectItem; stdcall;
    function Count: integer; stdcall;
    function ProjectGroupFile: string; stdcall;
  end;

  TNSProjectItem = class(TAutoObject, IProjectItem)
  private
    FProjItem: TXObject;
    FItems: TXObject;
    FItemObjs: TStringList;
    FIndex: integer;
    function ObjectCreated(name: string): boolean;
    function ObjectByName(name: string): TNSProjectItem;
    procedure Cleanup;
    procedure Checkitems;
    function Item(name, ptype: string): IProjectItem;
  protected
  public
    constructor Create( xobj: TXObject );
    destructor Destroy;
    function GetName: string;
    function GetFullName: string;
    procedure SetName( value: string );
    function AddFile(name: string): IProjectItem; stdcall;
    function AddFolder(name: string): IProjectItem; stdcall;
    function FileByName(name: string): IProjectItem; stdcall;
    function FolderByName(name: string): IProjectItem; stdcall;
    function Items(index: integer): IProjectItem; stdcall;
    function ItemCount: integer; stdcall;
    procedure RemoveItem(index: integer); stdcall;
    function ParentItem: IProjectItem; stdcall;
    procedure Delete; stdcall;
    function GetType: string; stdcall;
    procedure SetType( value: string );
    procedure SetFullName( value: string );
    function GetIndex: integer; stdcall;
    procedure SetIndex(index: integer); stdcall;
  end;

implementation

uses sysutils;

{ TNSProjectGroup }

function TNSProjectGroup.AddProject(name: string): IProjectItem;
var
  prj: TNSProjectItem;
begin
  if (ObjectCreated(name)) then begin
    raise Exception.Create('Project Already Exists');
    end;

  prj := TNSProjectItem.Create( FPrjGrp.AddObject('project') );
  prj.SetName(name);
  prj.SetType('Project');
  prj._AddRef;
  FProjects.AddObject(name, prj);
  result := prj;
end;

procedure TNSProjectGroup.Cleanup;
var
  i: integer;
begin
  for i := 0 to FProjects.Count -1 do
    TObject(FProjects.Objects[i]).Free;
  FProjects.Clear;
end;

function TNSProjectGroup.Count: integer;
begin
  result := FProjects.Count;
end;

constructor TNSProjectGroup.Create;
begin
  FPrjGrp := TXObject.Create;
  FProjects := TStringList.Create;
end;

destructor TNSProjectGroup.Destroy;
begin
  Cleanup;
  FProjects.Free;
end;

function TNSProjectGroup.FindProject(projectname: string): IProjectItem;
var
  xnode: IXMLDOMNode;
  xpath: string;
  prj: TNSProjectItem;
begin
  if (ObjectCreated(projectname)) then begin
    result := ObjectByName(projectname);
    exit;
    end;

  xpath := 'project[ProjectName = ''' + projectname + ''']';
  xnode := FPrjGrp.CurrentNode.selectSingleNode(xpath);
  if assigned(xnode) then begin
    prj := TNSProjectItem.Create(TXObject.Create(xnode));
    FProjects.AddObject(projectname, prj);
    end
  else
    result := nil;
end;

function TNSProjectGroup.LoadProject(filename: string): boolean;
var
  i, j: integer;
  xnode, xprjnode, pitems: IXMLDOMNode;
  aproj: IProjectItem;
  xml: IXMLDOMDocument;
begin
  CleanUp;
  xml := CoDOMDocument.Create;
  result := xml.load(filename);
//  result := FPrjGrp.Load(filename);
//  exit;
  for i := 0 to xml.documentElement.childNodes.length -1 do begin
    xprjnode := xml.documentElement.childNodes.item[i];
    xnode := xprjnode.selectSingleNode('name');
    if assigned(xnode) then
      aproj := self.AddProject( xnode.text );
    if assigned(aproj) then begin
      pitems := xprjnode.selectSingleNode('items');
      if assigned(pitems) then begin
        for j := 0 to pitems.childNodes.length - 1 do begin
          AddItem(aproj, pitems.childNodes.item[j]);
        end
      end;
    end;
  end;
  if result then FProjectFile := filename;
end;

procedure TNSProjectGroup.AddItem(parentitem: IProjectItem; item: IXMLDOMNode);
var
  k: integer;
  xpis: IXMLDOMNode;
  xatype, xaname, psubitems: IXMLDOMNode;
  prjitem: IProjectItem;
begin
  xatype := item.selectSingleNode('type');
  xaname := item.selectSingleNode('name');
  if assigned(xatype) and assigned(xaname) then begin
    if xatype.text = 'folder' then
      prjitem := parentitem.AddFolder(xaname.text)
    else if xatype.text = 'file' then
      prjitem := parentitem.AddFile(xaname.text);

    psubitems := item.selectSingleNode('items');
    if assigned(psubitems) then begin
      for k := 0 to psubitems.childNodes.length - 1 do begin
        AddItem(prjitem, psubitems.childNodes.item[k]);
      end
    end;
  end;
end;


function TNSProjectGroup.ObjectByName(name: string): TNSProjectItem;
var
  prj: TNSProjectItem;
  i: integer;
begin
  result := nil;
  for i := 0 to FProjects.Count -1 do begin
    prj := TNSProjectItem(FProjects.Objects[i]);
    if prj.GetName = name then begin
      result := prj;
      break
      end;
  end;
end;

function TNSProjectGroup.ObjectCreated(name: string): boolean;
var
  prj: TNSProjectItem;
  i: integer;
begin
  result := false;
  for i := 0 to FProjects.Count -1 do begin
    prj := TNSProjectItem(FProjects.Objects[i]);
    if prj.GetName = name then begin
      result := true;
      break
      end;
  end;
end;

function TNSProjectGroup.Projects(index: integer): IProjectItem;
begin
  result := TNSProjectItem(FProjects.Objects[index]);
end;

procedure TNSProjectGroup.RemoveProject(name: string);
begin
{ TODO 5 -otobrien -cProjects : Add Function to Remove a Project from a group }
end;

function TNSProjectGroup.SaveProject(filename: string): boolean;
begin
  result := FPrjGrp.Save(filename);
  if result then FProjectFile := filename;
end;

{ TNSProject }

function TNSProjectItem.AddFile(name: string): IProjectItem;
var
  item: TXObject;
  pitem: TNSProjectItem;
  idx: integer;
begin
  if (ObjectCreated(name)) then begin
    raise Exception.Create('File Already Exists');
   end;
  CheckItems;
  item := FItems.AddObject('item');
  //item.AddProperty('type', 'file');
  //item.SetValue(name);
  pitem := TNSProjectItem.Create(item);
  pitem.SetName(name);
  pitem.SetType('file');
  //pitem.SetFullName(name);
  pitem._AddRef;
  idx := FItemObjs.AddObject(name, pitem);
  pitem.SetIndex(idx);
  result := pitem;
end;

function TNSProjectItem.AddFolder(name: string): IProjectItem;
var
  item: TXObject;
  pitem: TNSProjectItem;
  idx: integer;
begin
  if (ObjectCreated(name)) then begin
    raise Exception.Create('Folder Already Exists');
    end;
  CheckItems;
  item := FItems.AddObject('item');
  //item.AddProperty('type', 'folder');
  //item.SetValue(name);
  pitem := TNSProjectItem.Create(item);
  pitem.SetName(name);
  pitem.SetType('folder');
  pitem.SetFullName(name);
  pitem._AddRef;
  idx := FItemObjs.AddObject(name, pitem);
  pitem.SetIndex(idx);
  result := pitem;
end;

procedure TNSProjectItem.CheckItems;
begin
  if FProjItem.ObjectExists('items') then begin
    FItems := FProjItem.ObjectByName('items');
  end
  else begin
    FItems := FProjItem.AddObject('items');
  end;
end;


procedure TNSProjectItem.Cleanup;
var
  i: integer;
begin
  for i := 0 to FItemObjs.Count -1 do
    TObject(FItemObjs.Objects[i]).Free;
  FItemObjs.Clear;
end;

constructor TNSProjectItem.Create(xobj: TXObject);
begin
  FProjItem := xobj;
  FItemObjs := TStringList.Create;
end;

procedure TNSProjectItem.Delete;
var
  i: integer;
begin
  while ItemCount > 0 do begin
    RemoveItem(0);
  end;
  FProjItem.Delete;
end;

destructor TNSProjectItem.Destroy;
begin
  FItemObjs.Free;
end;

function TNSProjectItem.FileByName(name: string): IProjectItem;
var
  xnode: IXMLDOMNode;
  xpath: string;
  prj: TNSProjectItem;
  idx: integer;
begin
  if (ObjectCreated(name)) then begin
    result := ObjectByName(name);
    exit;
    end;

  xpath := 'item[. = ''' + name + ''']';
  xnode := FItems.CurrentNode.selectSingleNode(xpath);
  if assigned(xnode) then begin
    prj := TNSProjectItem.Create(TXObject.Create(xnode));
    idx := FItemObjs.AddObject(name, prj);
    prj.SetIndex(idx);
    end
  else
    result := nil;
end;

function TNSProjectItem.FolderByName(name: string): IProjectItem;
var
  xnode: IXMLDOMNode;
  xpath: string;
  prj: TNSProjectItem;
  idx: integer;
begin
  if (ObjectCreated(name)) then begin
    result := ObjectByName(name);
    exit;
    end;

  xpath := 'item[. = ''' + name + ''']';
  xnode := FItems.CurrentNode.selectSingleNode(xpath);
  if assigned(xnode) then begin
    prj := TNSProjectItem.Create(TXObject.Create(xnode));
    idx := FItemObjs.AddObject(name, prj);
    prj.SetIndex(idx);
    end
  else
    result := nil;
end;


function TNSProjectItem.GetFullName: string;
begin
  result := FProjItem.NodeByName('name');
end;

function TNSProjectItem.GetIndex: integer;
begin
  result := FIndex;
end;

function TNSProjectItem.GetName: string;
begin
  if lowercase(self.GetType()) = 'file' then
    result := ExtractFileName( FProjItem.NodeByName('name') )
  else
    result := FProjItem.NodeByName('name');
end;

function TNSProjectItem.GetType: string;
begin
  result := FProjItem.NodeByName('type');
end;

function TNSProjectItem.Item(name, ptype: string): IProjectItem;
begin
  if (FProjItem.ObjectExists(name)) then
    result := TNSProjectItem.Create(FProjItem.ObjectByName(name))
  else
    result := nil;
end;

function TNSProjectItem.ItemCount: integer;
begin
  result := FItemObjs.Count;
end;

function TNSProjectItem.Items(index: integer): IProjectItem;
var
  pitem: TNSProjectItem;
begin
  if (index < FItemObjs.Count) then
    pitem := TNSProjectItem(FItemObjs.Objects[index])
  else
    pitem := nil;
  result := pitem;
end;

function TNSProjectItem.ObjectByName(name: string): TNSProjectItem;
var
  prj: TNSProjectItem;
  i: integer;
begin
  result := nil;
  for i := 0 to FItemObjs.Count -1 do begin
    prj := TNSProjectItem(FItemObjs.Objects[i]);
    if prj.GetName = name then begin
      result := prj;
      break
      end;
  end;
end;

function TNSProjectItem.ObjectCreated(name: string): boolean;
var
  prj: TNSProjectItem;
  i: integer;
begin
  result := false;
  for i := 0 to FItemObjs.Count -1 do begin
    prj := TNSProjectItem(FItemObjs.Objects[i]);
    if prj.GetName = name then begin
      result := true;
      break
      end;
  end;
end;

function TNSProjectItem.ParentItem: IProjectItem;
begin
  result := TNSProjectItem( FProjItem.ParentNode );
end;

procedure TNSProjectItem.RemoveItem(index: integer);
begin
  FItemObjs.Delete(index);
end;

procedure TNSProjectItem.SetFullName(value: string);
begin
  FProjItem.SetNode('fullname', value);
end;

procedure TNSProjectItem.SetIndex(index: integer);
begin
  FIndex := index;
end;

procedure TNSProjectItem.SetName(value: string);
begin
  FProjItem.SetNode('name', value);
end;


procedure TNSProjectItem.SetType(value: string);
begin
  FProjItem.SetNode('type', value);
end;

function TNSProjectGroup.ProjectGroupFile: string;
begin
  result := FProjectFile;
end;

end.
