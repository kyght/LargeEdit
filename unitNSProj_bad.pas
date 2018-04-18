unit unitNSProj;

interface

uses unitProject, unitxobject, classes, comobj, msxml2_tlb;

type
  TNSProjectItem = class;

  TNSProjectGroup = class(TXObject, IProjectGroup)
  private
    FPrjGrp: TXObject;
    //FProjects: TStringList;
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
  end;

  TNSProjectItem = class(TXObject, IProjectItem)
  private
    FProjItem: TXObject;
    FItems: TXObject;
    //FItemObjs: TStringList;
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
    function GetType: string;
    procedure SetType( value: string );
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
  //FProjects.AddObject(name, prj);
  result := prj;
end;

procedure TNSProjectGroup.Cleanup;
var
  i: integer;
begin
  {for i := 0 to FProjects.Count -1 do
    TObject(FProjects.Objects[i]).Free;
  FProjects.Clear;}
end;

function TNSProjectGroup.Count: integer;
begin
  result := FPrjGrp.ObjectCount; // FProjects.Count;
end;

constructor TNSProjectGroup.Create;
begin
  FPrjGrp := TXObject.Create;
  FPrjGrp.BaseClass := TNSProjectGroup;
  //FProjects := TStringList.Create;
end;

destructor TNSProjectGroup.Destroy;
begin
  Cleanup;
  //FProjects.Free;
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
    //FProjects.AddObject(projectname, prj);
    end
  else
    result := nil;
end;

function TNSProjectGroup.LoadProject(filename: string): boolean;
var
  i, j: integer;
  xnode, xprjnode, pitems: IXMLDOMNode;
  aproj: IProjectItem;
begin
  CleanUp;
  result := FPrjGrp.Load(filename);
  exit;
  for i := 0 to FPrjGrp.CurrentNode.childNodes.length -1 do begin
    xprjnode := FPrjGrp.CurrentNode.childNodes.item[i];
    xnode := FPrjGrp.CurrentNode.childNodes.item[i].selectSingleNode('name');
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
      prjitem := parentitem.AddFolder(xaname.text);

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
  FPrjGrp.ObjectByName(name);
{  for i := 0 to FProjects.Count -1 do begin
    prj := TNSProjectItem(FProjects.Objects[i]);
    if prj.GetName = name then begin
      result := prj;
      break
      end;
  end;}
end;

function TNSProjectGroup.ObjectCreated(name: string): boolean;
var
  prj: TNSProjectItem;
  i: integer;
begin
//  result := false;
  result := FPrjGrp.ObjectExists(name);
{  for i := 0 to FProjects.Count -1 do begin
    prj := TNSProjectItem(FProjects.Objects[i]);
    if prj.GetName = name then begin
      result := true;
      break
      end;
  end;}
end;

function TNSProjectGroup.Projects(index: integer): IProjectItem;
var
  prj: TNSProjectItem;
begin
  prj := TNSProjectItem(FPrjGrp.Objects[index]);
  result := prj as IProjectItem;
//  result := TNSProjectItem(FProjects.Objects[index]);
end;

procedure TNSProjectGroup.RemoveProject(name: string);
begin
{ TODO 5 -otobrien -cProjects : Add Function to Remove a Project from a group }
end;

function TNSProjectGroup.SaveProject(filename: string): boolean;
begin
  result := FPrjGrp.Save(filename);
end;

{ TNSProject }

function TNSProjectItem.AddFile(name: string): IProjectItem;
var
  item: TXObject;
  pitem: TNSProjectItem;
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
  pitem._AddRef;
  //FItemObjs.AddObject(name, pitem);
  result := pitem;
end;

function TNSProjectItem.AddFolder(name: string): IProjectItem;
var
  item: TXObject;
  pitem: TNSProjectItem;
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
  pitem._AddRef;
  //FItemObjs.AddObject(name, pitem);
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
{  for i := 0 to FItemObjs.Count -1 do
    TObject(FItemObjs.Objects[i]).Free;
  FItemObjs.Clear;}
end;

constructor TNSProjectItem.Create(xobj: TXObject);
begin
  FProjItem := xobj;
  FProjItem.BaseClass := TNSProjectItem;
  //FItemObjs := TStringList.Create;
end;

destructor TNSProjectItem.Destroy;
begin
  //FItemObjs.Free;
end;

function TNSProjectItem.FileByName(name: string): IProjectItem;
var
  xnode: IXMLDOMNode;
  xpath: string;
  prj: TNSProjectItem;
begin
  if (ObjectCreated(name)) then begin
    result := ObjectByName(name);
    exit;
    end;

  xpath := 'item[. = ''' + name + ''']';
  xnode := FItems.CurrentNode.selectSingleNode(xpath);
  if assigned(xnode) then begin
    prj := TNSProjectItem.Create(TXObject.Create(xnode));
    //FItemObjs.AddObject(name, prj);
    end
  else
    result := nil;
end;

function TNSProjectItem.FolderByName(name: string): IProjectItem;
var
  xnode: IXMLDOMNode;
  xpath: string;
  prj: TNSProjectItem;
begin
  if (ObjectCreated(name)) then begin
    result := ObjectByName(name);
    exit;
    end;

  xpath := 'item[. = ''' + name + ''']';
  xnode := FItems.CurrentNode.selectSingleNode(xpath);
  if assigned(xnode) then begin
    prj := TNSProjectItem.Create(TXObject.Create(xnode));
    //FItemObjs.AddObject(name, prj);
    end
  else
    result := nil;
end;


function TNSProjectItem.GetFullName: string;
begin
  result := FProjItem.NodeByName('name');
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
  result := FItems.ObjectCount;
end;

function TNSProjectItem.Items(index: integer): IProjectItem;
var
  pitem: TNSProjectItem;
begin
  result := TNSProjectItem(FItems.Objects[index]);
{  if (index < FItemObjs.Count) then
    pitem := TNSProjectItem(FItemObjs.Objects[index])
  else
    pitem := nil;
  result := pitem;}
end;

function TNSProjectItem.ObjectByName(name: string): TNSProjectItem;
var
  prj: TNSProjectItem;
  i: integer;
begin
  result := TNSProjectItem(FItems.ObjectByName(name));
{  result := nil;
  for i := 0 to FItemObjs.Count -1 do begin
    prj := TNSProjectItem(FItemObjs.Objects[i]);
    if prj.GetName = name then begin
      result := prj;
      break
      end;
  end;}
end;

function TNSProjectItem.ObjectCreated(name: string): boolean;
var
  prj: TNSProjectItem;
  i: integer;
begin
//  result := false;
  result := FItems.ObjectExists(name);
{  for i := 0 to FItemObjs.Count -1 do begin
    prj := TNSProjectItem(FItemObjs.Objects[i]);
    if prj.GetName = name then begin
      result := true;
      break
      end;
  end;}
end;

procedure TNSProjectItem.RemoveItem(index: integer);
begin

end;

procedure TNSProjectItem.SetName(value: string);
begin
  FProjItem.SetNode('name', value);
end;


procedure TNSProjectItem.SetType(value: string);
begin
  FProjItem.SetNode('type', value);
end;

end.
