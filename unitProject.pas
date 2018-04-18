unit unitProject;

interface

type

  IProjectItem = interface
    ['{159F2BF5-B9CF-4789-B1C6-C4F87BB494F1}']
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
    procedure Delete; stdcall;
    function ParentItem: IProjectItem; stdcall;
    function GetType: string; stdcall;
    function GetIndex: integer; stdcall;
    procedure SetIndex(index: integer); stdcall;
  end;

  IProjectGroup = interface
    ['{E17761A6-DA9F-4DD9-B39B-8B70D011F31D}']
    function AddProject(name: string): IProjectItem; stdcall;
    procedure RemoveProject(name: string); stdcall;
    function FindProject(projectname: string): IProjectItem; stdcall;
    function LoadProject(filename: string): boolean; stdcall;
    function SaveProject(filename: string): boolean; stdcall;
    function Projects(index: integer): IProjectItem; stdcall;
    function Count: integer; stdcall;
    function ProjectGroupFile: string; stdcall;
  end;

implementation

end.
