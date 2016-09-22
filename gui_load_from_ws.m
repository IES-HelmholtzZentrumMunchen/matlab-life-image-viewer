function varargout = gui_load_from_ws(varargin)
% GUI_LOAD_FROM_WS MATLAB code for gui_load_from_ws.fig
%      GUI_LOAD_FROM_WS, by itself, creates a new GUI_LOAD_FROM_WS or raises the existing
%      singleton*.
%
%      H = GUI_LOAD_FROM_WS returns the handle to a new GUI_LOAD_FROM_WS or the handle to
%      the existing singleton*.
%
%      GUI_LOAD_FROM_WS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_LOAD_FROM_WS.M with the given input arguments.
%
%      GUI_LOAD_FROM_WS('Property','Value',...) creates a new GUI_LOAD_FROM_WS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_load_from_ws_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_load_from_ws_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_load_from_ws

% Last Modified by GUIDE v2.5 11-May-2016 23:05:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_load_from_ws_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_load_from_ws_OutputFcn, ...
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


% --- Executes just before gui_load_from_ws is made visible.
function gui_load_from_ws_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_load_from_ws (see VARARGIN)

% Choose default command line output for gui_load_from_ws
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.noticelabel, 'String', varargin{2});
set(handles.varlist,'String',evalin('base','who;'));

% UIWAIT makes prout wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_load_from_ws_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% contents = cellstr(get(handles.varlist,'String'));
% varargout{1} = contents{get(handles.varlist,'Value')};

varargout{1} = evalin('base',handles.return);

delete(handles.figure1);


% --- Executes on selection change in varlist.
function varlist_Callback(hObject, eventdata, handles)
% hObject    handle to varlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns varlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from varlist



% --- Executes during object creation, after setting all properties.
function varlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to varlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

contents = cellstr(get(handles.varlist,'String'));
handles.return = contents{get(handles.varlist,'Value')};
guidata(hObject, handles);

close(handles.output);

% --- Executes on button press in cancelbutton.
function cancelbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cancelbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.return = '[]';
guidata(hObject, handles);

close(handles.output);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
    uiresume(hObject);
else
    % The GUI is no longer waiting, just close it
    delete(hObject);
end
