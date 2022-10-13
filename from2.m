function varargout = from2(varargin)
% FROM2 MATLAB code for from2.fig
%      FROM2, by itself, creates a new FROM2 or raises the existing
%      singleton*.
%
%      H = FROM2 returns the handle to a new FROM2 or the handle to
%      the existing singleton*.
%
%      FROM2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FROM2.M with the given input arguments.
%
%      FROM2('Property','Value',...) creates a new FROM2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before from2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to from2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help from2

% Last Modified by GUIDE v2.5 28-Dec-2015 00:02:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @from2_OpeningFcn, ...
                   'gui_OutputFcn',  @from2_OutputFcn, ...
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


% --- Executes just before from2 is made visible.
function from2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to from2 (see VARARGIN)

% Choose default command line output for from2
handles.output = hObject;
% create an axes that spans the whole gui

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes from2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = from2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
a = get(handles.edit1,'String');
if isempty(a)  
msgbox({'Invalid' 'please select image'}, 'Error','error');  
else
I=imread(a);
NG=Log(I);
imshow(NG,'parent',handles.axes2);
end

%handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
a = get(handles.edit1,'String');
if isempty(a)  
msgbox({'Invalid' 'please select image'}, 'Error','error');  
else
I=imread(a);
e2= get(handles.edit2,'String');
if isempty(e2)  
msgbox({'Invalid' 'please enter gama value'}, 'Error','error');  
else
g=str2num(e2);
NG=Gama(I,g );
imshow(NG,'parent',handles.axes2);
end
end

%handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
path=uigetimagefile();
set(handles.edit1,'string',path);
img=imread(path);
imshow(img,'parent',handles.axes1);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

a = get(handles.edit1,'String');
if isempty(a)  
msgbox({'Invalid' 'please select image'}, 'Error','error');  
else
I=imread(a);
[w h l]=size(I);
isBinaryImage = all( I(:)==0 | I(:)==1);
if l==3
    NR=negative_rgb( I );
    imshow(NR,'parent',handles.axes2);
elseif isBinaryImage==1
   NB=negative_binary( I );
   imshow(NB,'parent',handles.axes2);
elseif l==1 & isBinaryImage==0
    NG=negative_gray( I );
   imshow(NG,'parent',handles.axes2);
end
end

%handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
run;
close(from2);
