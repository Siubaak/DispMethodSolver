function varargout = Frame(varargin)
% FRAME MATLAB code for Frame.fig
%      FRAME, by itself, creates a new FRAME or raises the existing
%      singleton*.
%
%      H = FRAME returns the handle to a new FRAME or the handle to
%      the existing singleton*.
%
%      FRAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRAME.M with the given input arguments.
%
%      FRAME('Property','Value',...) creates a new FRAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Frame_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Frame_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% add the above text to modify the response to help Frame

% Last Modified by GUIDE v2.5 06-Sep-2015 16:46:52

% Begin initialization code - DO NOT ADD
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Frame_OpeningFcn, ...
                   'gui_OutputFcn',  @Frame_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT ADD


% --- Executes just before Frame is made visible.
function Frame_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Frame (see VARARGIN)

% Choose default command line output for Frame
handles.output = hObject;
global file hn hmm hm hc hl R;
file(1,1) = '\';
hn = handles.nodetable;
hmm = handles.materialtable;
hm = handles.membertable;
hc = handles.constrainttable;
hl = handles.loadtable;
R = [];
Figure();
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Frame wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Frame_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file R fig;
file(1,1) = '\';
set(handles.nodetable, 'data', {});
set(handles.materialtable, 'data', {});
set(handles.membertable, 'data', {});
set(handles.constrainttable, 'data', {});
set(handles.loadtable, 'data', {});
R = [];
cla(fig);
guidata(hObject, handles);

% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file R;
[filename, pathname] = uigetfile('*.mat', 'Open');
if filename ~= 0
    file = fullfile(pathname,filename);
    load(file);
    set(handles.nodetable, 'data', a1);
    set(handles.materialtable, 'data', a2);
    set(handles.membertable, 'data', a3);
    set(handles.constrainttable, 'data', a4);
    set(handles.loadtable, 'data', a5);
    R = [];
    Figure();
end
guidata(hObject, handles);

% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file;
if file(1,1) == '\'
    [filename, pathname] = uiputfile('*.mat', 'Save');
    file = fullfile(pathname,filename);
end
if file(1,1) ~= '\'
    a1 = get(handles.nodetable,'data');
    a2 = get(handles.materialtable,'data');
    a3 = get(handles.membertable,'data');
    a4 = get(handles.constrainttable,'data');
    a5 = get(handles.loadtable,'data');
    save(file,'a1','a2','a3','a4','a5');
end
guidata(hObject, handles);

% --------------------------------------------------------------------
function saveas_Callback(hObject, eventdata, handles)
% hObject    handle to saveas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file;
[filename, pathname] = uiputfile('*.mat', 'Save As');
file = fullfile(pathname,filename);
if filename ~= 0
    a1 = get(handles.nodetable,'data');
    a2 = get(handles.materialtable,'data');
    a3 = get(handles.membertable,'data');
    a4 = get(handles.constrainttable,'data');
    a5 = get(handles.loadtable,'data');
    save(file,'a1','a2','a3','a4','a5');
end
guidata(hObject, handles);

% --------------------------------------------------------------------
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
getda();
main();
guidata(hObject, handles);

% --------------------------------------------------------------------
function figure_Callback(hObject, eventdata, handles)
% hObject    handle to figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
Figure();
guidata(hObject, handles);

% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About();
guidata(hObject, handles);

% --------------------------------------------------------------------
function anode_Callback(hObject, eventdata, handles)
% hObject    handle to anode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.nodetable,'data');
[a,~] = size(data);
if a == 0
    data(a+1,:) = {''};
else
    data(a+1,:) = data(a,:);
end
set(handles.nodetable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function amaterial_Callback(hObject, eventdata, handles)
% hObject    handle to amaterial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.materialtable,'data');
[a,~] = size(data);
if a == 0
    data(a+1,:) = {''};
else
    data(a+1,:) = data(a,:);
end
set(handles.materialtable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function amember_Callback(hObject, eventdata, handles)
% hObject    handle to amember (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.membertable,'data');
[a,~] = size(data);
if a == 0
    data(a+1,:) = {''};
else
    data(a+1,:) = data(a,:);
end
set(handles.membertable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function aconstraint_Callback(hObject, eventdata, handles)
% hObject    handle to aconstraint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.constrainttable,'data');
[a,~] = size(data);
if a == 0
    data(a+1,:) = {''};
else
    data(a+1,:) = data(a,:);
end
set(handles.constrainttable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function aload_Callback(hObject, eventdata, handles)
% hObject    handle to aload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.loadtable,'data');
[a,~] = size(data);
if a == 0
    data(a+1,:) = {''};
else
    data(a+1,:) = data(a,:);
end
set(handles.loadtable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function runn_Callback(hObject, eventdata, handles)
% hObject    handle to runn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function delete_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function dnode_Callback(hObject, eventdata, handles)
% hObject    handle to dnode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.nodetable,'data');
[a,~] = size(data);
data(a,:) = [];
set(handles.nodetable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function dmaterial_Callback(hObject, eventdata, handles)
% hObject    handle to dmaterial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.materialtable,'data');
[a,~] = size(data);
data(a,:) = [];
set(handles.materialtable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function dmember_Callback(hObject, eventdata, handles)
% hObject    handle to dmember (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.membertable,'data');
[a,~] = size(data);
data(a,:) = [];
set(handles.membertable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function dconstraint_Callback(hObject, eventdata, handles)
% hObject    handle to dconstraint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.constrainttable,'data');
[a,~] = size(data);
data(a,:) = [];
set(handles.constrainttable, 'data', data);
guidata(hObject, handles);

% --------------------------------------------------------------------
function dload_Callback(hObject, eventdata, handles)
% hObject    handle to dload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
R = [];
data = get(handles.loadtable,'data');
[a,~] = size(data);
data(a,:) = [];
set(handles.loadtable, 'data', data);
guidata(hObject, handles);
