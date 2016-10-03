function varargout = querry_menu0(varargin)
% QUERRY_MENU0 MATLAB code for querry_menu0.fig
%      QUERRY_MENU0, by itself, creates a new QUERRY_MENU0 or raises the existing
%      singleton*.
%
%      H = QUERRY_MENU0 returns the handle to a new QUERRY_MENU0 or the handle to
%      the existing singleton*.
%
%      QUERRY_MENU0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUERRY_MENU0.M with the given input arguments.
%
%      QUERRY_MENU0('Property','Value',...) creates a new QUERRY_MENU0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before querry_menu0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to querry_menu0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help querry_menu0

% Last Modified by GUIDE v2.5 04-Oct-2015 14:46:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @querry_menu0_OpeningFcn, ...
                   'gui_OutputFcn',  @querry_menu0_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before querry_menu0 is made visible.
function querry_menu0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to querry_menu0 (see VARARGIN)

% Choose default command line output for querry_menu0
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes querry_menu0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = querry_menu0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chkstatus1;
chkstatus1 = get(hObject,'Value');
if (chkstatus1 == 1)
    sel1 = get(hObject,'String');
else
    sel1 = [];
end
% Hint: get(hObject,'Value') returns toggle state of checkbox1
guidata(hObject, handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chkstatus2;
chkstatus2 = get(hObject,'Value');
if (chkstatus2 == 1)
    sel2 = get(hObject,'String');
else
    sel2 = [];
end
% Hint: get(hObject,'Value') returns toggle state of checkbox2
guidata(hObject, handles);


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chkstatus3;
chkstatus3 = get(hObject,'Value');
if (chkstatus3 == 1)
    sel3 = get(hObject,'String');
else
    sel3 = [];
end
% Hint: get(hObject,'Value') returns toggle state of checkbox3
guidata(hObject, handles);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global conn;
global chkstatus1;
global chkstatus2;
global chkstatus3;

cond = get(handles.edit1,'String');

if (chkstatus1 == 1)
    sel1 = get(handles.checkbox1,'String');
else
    sel1 = [];
end

if (chkstatus2 == 1)
    sel2 = get(handles.checkbox2,'String');
else
    sel2 = [];
end

if (chkstatus3 == 1)
    sel3 = get(handles.checkbox3,'String');
else
    sel3 = [];
end

similare2 = querry0('audio_recogn.voicemap',conn, cond, sel1, sel2, sel3)

n = numel(similare2);

if (isempty(sel1)+isempty(sel2)+isempty(sel3)==2)
    sim2a = similare2;
    sim2b=[];
    sim2c=[];
elseif (isempty(sel1)+isempty(sel2)+isempty(sel3)==1)
    sim2a = similare2(1:n/2);
    sim2b = similare2(n/2+1:n);
    sim2c = [];
elseif (isempty(sel1)+isempty(sel2)+isempty(sel3)==0)
    sim2a = similare2(1:n/3);
    sim2b = similare2(n/3+1:2*n/3);
    sim2c = similare2(2*n/3+1:n);
end

str1 = strcat(sim2a,{'     '},sim2b,{'     '},sim2c);
set(handles.listbox1,'String',str1);


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cond = get(hObject,'String');

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(main_menu,'visible','on');
set(querry_menu0,'visible','off');
guidata(hObject, handles);
