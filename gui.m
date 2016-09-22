function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 12-May-2016 10:49:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Set mouse click callback
set(hObject,'WindowButtonDownFcn',{@figure1_WindowButtonDownFcn,hObject});

% Save data
guidata(hObject, handles);

% Initialize
handles = initialize_ui(hObject, handles);

% Check if an image is passed as argument
if length(varargin) == 1
    set_current_image(hObject, handles, varargin{1});
end


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function xyslider_Callback(hObject, eventdata, handles)
% hObject    handle to xyslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns xytext of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set_current_image_position(handles.output, handles, round(get(handles.yzslider,'Value')), round(get(handles.xzslider,'Value')), round(get(handles.xyslider,'Value')));


% --- Executes during object creation, after setting all properties.
function xyslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xzslider_Callback(hObject, eventdata, handles)
% hObject    handle to xzslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns xytext of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set_current_image_position(handles.output, handles, round(get(handles.yzslider,'Value')), round(get(handles.xzslider,'Value')), round(get(handles.xyslider,'Value')));


% --- Executes during object creation, after setting all properties.
function xzslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xzslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function yzslider_Callback(hObject, eventdata, handles)
% hObject    handle to yzslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns xytext of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set_current_image_position(handles.output, handles, round(get(handles.yzslider,'Value')), round(get(handles.xzslider,'Value')), round(get(handles.xyslider,'Value')));


% --- Executes during object creation, after setting all properties.
function yzslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yzslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function channel_slider_Callback(hObject, eventdata, handles)
% hObject    handle to channel_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function channel_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channel_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function menu_view_Callback(hObject, eventdata, handles)
% hObject    handle to menu_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function item_view_positioncross_Callback(hObject, eventdata, handles)
% hObject    handle to item_view_positioncross (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    handles.positioncross = ~handles.positioncross;
    guidata(hObject, handles);
    
    if handles.positioncross
        set(handles.item_view_positioncross,'Checked','on');
    else
        set(handles.item_view_positioncross,'Checked','off');
    end
    
    if ~isempty(handles.image)
        update_current_image_view(handles);
    end


% --------------------------------------------------------------------
function item_file_open_Callback(hObject, eventdata, handles)
% hObject    handle to item_file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    if ~isempty(handles.image)
        result = questdlg('Opening another image will make the current one to be closed. Do you want to close the current image?','Closing image confirmation','Yes','No','No');
    end
    
    if isempty(handles.image) || strcmp(result,'Yes')
        initialize_ui(handles.output, handles);
    
        [filename,pathname,~] = uigetfile('*.*');

        if ~isempty(filename)
            h = waitbar(0,'Loading image...');
            data = bfopen(strcat(pathname,filename));
            waitbar(0.75,h);
            set_current_image(hObject, handles, data);
            waitbar(1,h);
            close(h);
        end
    end
    
    
% --------------------------------------------------------------------
function item_image_wsopen_Callback(hObject, eventdata, handles)
% hObject    handle to item_image_wsopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    if ~isempty(handles.image)
        result = questdlg('Opening another image will make the current one to be closed. Do you want to close the current image?','Closing image confirmation','Yes','No','No');
    end
    
    if isempty(handles.image) || strcmp(result,'Yes')
        initialize_ui(handles.output, handles);
    
        variable = gui_load_from_ws([], 'Please select an image to load.');

        if ~isempty(variable)
            h = waitbar(0,'Loading image...');
            set_current_image(hObject, handles, variable);
            waitbar(1,h);
            close(h);
        end
    end


% --------------------------------------------------------------------
function item_file_close_Callback(hObject, eventdata, handles)
% hObject    handle to item_file_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    result = questdlg('Are you sure you want to close the opened image?','Closing image confirmation','Yes','No','No');
    
    if strcmp(result,'Yes')
        initialize_ui(handles.output, handles);
    end


% --------------------------------------------------------------------
function item_file_quit_Callback(hObject, eventdata, handles)
% hObject    handle to item_file_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    result = questdlg('Are you sure you want to quit the viewer?', 'Closing viewer confirmation', 'Yes', 'No', 'No');
    
    if strcmp(result,'Yes')
        close(handles.output);
    end
    

% --------------------------------------------------------------------
function item_view_mask_Callback(hObject, eventdata, handles)
% hObject    handle to item_view_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    if ~isempty(handles.image)
        if ~isempty(handles.mask)
            result = questdlg('Opening another mask will make the current one to be closed. Do you want to close the current mask?','Closing mask confirmation','Yes','No','No');
        end

        if isempty(handles.mask) || strcmp(result,'Yes')
            [filename,pathname,~] = uigetfile('*.*');

            if ~isempty(filename)
                h = waitbar(0,'Loading mask...');
                data = bfopen(strcat(pathname,filename));
                waitbar(0.75,h);
                set_current_mask(hObject, handles, data);
                waitbar(1,h);
            end

            close(h);
            set(handles.item_view_removemask,'Enable','on');
        end
    else
        errordlg('Unable to open mask because there is no opened image!','Unable to open mask');
    end
    

% --------------------------------------------------------------------
function item_view_wsmask_Callback(hObject, eventdata, handles)
% hObject    handle to item_view_wsmask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    if ~isempty(handles.image)
        if ~isempty(handles.mask)
            result = questdlg('Opening another mask will make the current one to be closed. Do you want to close the current mask?','Closing mask confirmation','Yes','No','No');
        end

        if isempty(handles.mask) || strcmp(result,'Yes')
            variable = gui_load_from_ws([],'Please select a mask to load.');

            if ~isempty(variable)
                h = waitbar(0,'Loading mask...');
                set_current_mask(hObject, handles, variable);
                waitbar(1,h);
            end

            close(h);
            set(handles.item_view_removemask,'Enable','on');
        end
    else
        errordlg('Unable to open mask because there is no opened image!','Unable to open mask');
    end


% --------------------------------------------------------------------
function item_view_removemask_Callback(hObject, eventdata, handles)
% hObject    handle to item_view_removemask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    result = questdlg('Are you sure you want to close the mask?','Closing mask confirmation','Yes','No','No');
    
    if strcmp(result,'Yes') && ~isempty(handles.image)
        handles.mask = [];
        update_current_image_view(handles);
        set(handles.item_view_removemask,'Enable','off');
        guidata(hObject, handles);
    end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(object, eventdata, hObject)
% object    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% hObject    handle to figure

    handles = guidata(hObject);
    
    mouse_pos = get(handles.xyview,'CurrentPoint');
    lim_x = get(handles.xyview,'XLim');
    lim_y = get(handles.xyview,'YLim');
    
    if lim_x(1) <= mouse_pos(1,1) && mouse_pos(1,1) <= lim_x(2) && ...
       lim_y(1) <= mouse_pos(1,2) && mouse_pos(1,2) <= lim_y(2)
        x_pos = round(mouse_pos(1,2)/handles.x_physical);
        y_pos = round(mouse_pos(1,1)/handles.y_physical);
        z_pos = round(handles.z_pos);
    else
        mouse_pos = get(handles.xzview,'CurrentPoint');
        lim_x = get(handles.xzview,'XLim');
        lim_y = get(handles.xzview,'YLim');
        
        if lim_x(1) <= mouse_pos(1,1) && mouse_pos(1,1) <= lim_x(2) && ...
           lim_y(1) <= mouse_pos(1,2) && mouse_pos(1,2) <= lim_y(2)
            x_pos = round(mouse_pos(1,2)/handles.x_physical);
            y_pos = round(handles.y_pos);
            z_pos = round(mouse_pos(1,1)/handles.z_physical);
        else
            mouse_pos = get(handles.zyview,'CurrentPoint');
            lim_x = get(handles.zyview,'XLim');
            lim_y = get(handles.zyview,'YLim');
            
            if lim_x(1) <= mouse_pos(1,1) && mouse_pos(1,1) <= lim_x(2) && ...
               lim_y(1) <= mouse_pos(1,2) && mouse_pos(1,2) <= lim_y(2)
                x_pos = round(handles.x_pos);
                y_pos = round(mouse_pos(1,1)/handles.y_physical);
                z_pos = round(mouse_pos(1,2)/handles.z_physical);
            else
                x_pos = handles.x_pos;
                y_pos = handles.y_pos;
                z_pos = handles.z_pos;
            end
        end
    end
    
    set_current_image_position(hObject, handles, x_pos, y_pos, z_pos);
    set(handles.xyslider,'Value',z_pos);
    set(handles.xzslider,'Value',y_pos);
    set(handles.yzslider,'Value',x_pos);


% --- Initialize the window (clear figure, switch, etc.)
function h = initialize_ui(hObject, handles)
% hObject    handle to figure
% handles    structure with handles and user data (see GUIDATA)

    % Initialize data
    handles.image = [];
    handles.mask = [];
    
    % Initialize sliders
    set(handles.xyslider,'Enable','off');
    set(handles.xyslider,'SliderStep',[0.01,0.1]);
    set(handles.xyslider,'Min',1);
    set(handles.xyslider,'Max',1);
    set(handles.xyslider,'Value',1);
    set(handles.xzslider,'Enable','off');
    set(handles.xzslider,'SliderStep',[0.01,0.1]);
    set(handles.xzslider,'Min',1);
    set(handles.xzslider,'Max',1);
    set(handles.xzslider,'Value',1);
    set(handles.yzslider,'Enable','off');
    set(handles.yzslider,'SliderStep',[0.01,0.1]);
    set(handles.yzslider,'Min',1);
    set(handles.yzslider,'Max',1);
    set(handles.yzslider,'Value',1);
    
    set(handles.channel_slider,'Enable','off');
    set(handles.channel_slider,'SliderStep',[0.01,0.1]);
    set(handles.channel_slider,'Min',1);
    set(handles.channel_slider,'Max',1);
    set(handles.channel_slider,'Value',1);
    
    % Initialize radio buttons
    set(handles.channel_color,'Enable','off');
    set(handles.channel_grayscale,'Enable','off');
    
    % Initialize display zones
    cla(handles.xyview);
    set(handles.xyview,'Visible','off');
    colormap(handles.xyview, gray);
    cla(handles.xzview);
    set(handles.xzview,'Visible','off');
    colormap(handles.xzview, gray);
    cla(handles.zyview);
    set(handles.zyview,'Visible','off');
    colormap(handles.zyview, gray);

    % Initialize menu items
    set(handles.item_view_positioncross,'Checked','on');
    handles.positioncross = true;
    set(handles.item_view_removemask,'Enable','off');
    
    % Initialize position information
    set(handles.xtext,'String','X:');
    set(handles.itext,'String','I:');
    set(handles.ytext,'String','Y:');
    set(handles.jtext,'String','J:');
    set(handles.ztext,'String','Z:');
    set(handles.ktext,'String','K:');
    
    set(handles.intensity_pixel,'String','Current pixel: ');
    set(handles.intensity_minmax,'String','Min/Max: ');

    % Update handles structure
    guidata(hObject, handles);
    
    h = handles;


% --- Set an image as current
function set_current_image(hObject, handles, data)
% hObject    handle to figure
% handles    structure with handles and user data (see GUIDATA)
% data       data structure from bioformat library
    
    % Get image size and pixel size
    if iscell(data)
        handles.x_size = data{1,4}.getPixelsSizeX(0).getValue();
        handles.y_size = data{1,4}.getPixelsSizeY(0).getValue();
        handles.z_size = data{1,4}.getPixelsSizeZ(0).getValue();
        handles.x_physical = double(data{1,4}.getPixelsPhysicalSizeX(0).value());
        handles.y_physical = double(data{1,4}.getPixelsPhysicalSizeY(0).value());
        handles.z_physical = double(data{1,4}.getPixelsPhysicalSizeZ(0).value());
    else
        handles.x_size = size(data,2);
        handles.y_size = size(data,1);
        handles.z_size = size(data,3);
        handles.x_physical = 1;
        handles.y_physical = 1;
        handles.z_physical = 1;
    end
    
    % Get number of channels in image
    if iscell(data)
        handles.number_channels = data{1,4}.getPixelsSizeC(0).getValue();
    else
        handles.number_channels = size(data,4);
    end
    
    % Create corresponding physical position vectors
    handles.x_vec = (0:handles.x_size-1).*handles.x_physical;
    handles.y_vec = (0:handles.y_size-1).*handles.y_physical;
    handles.z_vec = (0:handles.z_size-1).*handles.z_physical;
    
    % Get image physicial unit of position
    if iscell(data)
        handles.x_unit = char(data{1,4}.getPixelsPhysicalSizeX(0).unit().getSymbol());
        handles.y_unit = char(data{1,4}.getPixelsPhysicalSizeY(0).unit().getSymbol());
        handles.z_unit = char(data{1,4}.getPixelsPhysicalSizeZ(0).unit().getSymbol());
    else
        handles.x_unit = 'pixels';
        handles.y_unit = 'pixels';
        handles.z_unit = 'pixels';
    end
    
    % Get image intensities
    if iscell(data)
        if handles.number_channels > 1
            handles.image = zeros(handles.x_size, handles.y_size, handles.z_size, handles.number_channels);

            % For now we are displaying 3 channels in order of coding in
            % (R,G,B) data (values between 0 and 1).
            for c = 1:handles.number_channels
                handles.image(:,:,:,c) = handles.image(:,:,:,c) + double(reshape(cell2mat(data{1,1}(c:handles.number_channels:end,1)'), handles.x_size, handles.y_size, handles.z_size)) ./ 255.0;
            end
        else
            handles.image = reshape(cell2mat(data{1}(:,1)'), handles.x_size, handles.y_size, handles.z_size);
        end
    else
        handles.image = data;
    end
    
    % Get image range
    handles.intensityrange = [min(min(min(handles.image))),max(max(max(handles.image)))];
    
    % Initialize min/max display
    set(handles.intensity_minmax,'String',horzcat('Min/Max: ',num2str(handles.intensityrange(1)),'/',num2str(handles.intensityrange(2))));
    
    % Save image info inside figure handle
    guidata(hObject, handles);
    
    % Initialize sliders
    set(handles.xyslider,'Enable','on');
    set(handles.xyslider,'Max',handles.z_size);
    set(handles.xyslider,'SliderStep',[1,5]./handles.z_size);
    set(handles.xzslider,'Enable','on');
    set(handles.xzslider,'Max',handles.y_size);
    set(handles.xzslider,'SliderStep',[1,5]./handles.y_size);
    set(handles.yzslider,'Enable','on');
    set(handles.yzslider,'Max',handles.x_size);
    set(handles.yzslider,'SliderStep',[1,5]./handles.x_size);
    
    % Update position of sliders
    x_pos = round(handles.x_size/2);
    y_pos = round(handles.y_size/2);
    z_pos = round(handles.z_size/2);
    set(handles.xyslider,'Value',z_pos);
    set(handles.xzslider,'Value',y_pos);
    set(handles.yzslider,'Value',x_pos);
    
    % Update image xytext
    set_current_image_position(hObject, handles, x_pos, y_pos, z_pos);
    
% --- Set an mask as current
function set_current_mask(hObject, handles, data)
% hObject    handle to figure
% handles    structure with handles and user data (see GUIDATA)
% data       data structure from bioformat library

    % Check correspondance of mask size with image size
    if (iscell(data) && (handles.x_size ~= size(data{1}{1},2) || handles.y_size ~= size(data{1}{1},1) || handles.z_size ~= length(data{1}))) || ...
       (handles.x_size ~= size(data,2) || handles.y_size ~= size(data,1) || handles.z_size ~= size(data,3))
        errordlg('The mask does not have the same size as image!','Error when displaying mask on image');
    else
        % Get image intensities
        if iscell(data)
            handles.mask = reshape(cell2mat(data{1}(:,1)'), handles.x_size, handles.y_size, handles.z_size);
        else
            handles.mask = data;
        end
        
        % Update image xytext
        set_current_image_position(hObject, handles, round(get(handles.yzslider,'Value')), round(get(handles.xzslider,'Value')), round(get(handles.xyslider,'Value')));
    end


% --- Set current image position
function set_current_image_position(hObject, handles, x_pos, y_pos, z_pos)
% hObject    handle to figure
% handles    structure with handles and user data (see GUIDATA)
% x_pos      xytext of the image on X-axis
% y_pos      xytext of the image on Y-axis
% z_pos      xytext of the image on Z-axis

    % Save position information information
    handles.x_pos = x_pos;
    handles.y_pos = y_pos;
    handles.z_pos = z_pos;
    guidata(hObject, handles);
    
    % Set text information
    set(handles.itext,'String',horzcat('I: ',num2str(handles.x_pos),' / ',num2str(handles.x_size),' pixels'));
    set(handles.xtext,'String',horzcat('X: ',num2str(handles.x_pos*handles.x_physical,'%.2f'),' / ',num2str(handles.x_size*handles.x_physical,'%.2f'),' ',handles.x_unit));
    set(handles.jtext,'String',horzcat('J: ',num2str(handles.y_pos),' / ',num2str(handles.y_size),' pixels'));
    set(handles.ytext,'String',horzcat('X: ',num2str(handles.y_pos*handles.y_physical,'%.2f'),' / ',num2str(handles.y_size*handles.y_physical,'%.2f'),' ',handles.y_unit));
    set(handles.ktext,'String',horzcat('K: ',num2str(handles.z_pos),' / ',num2str(handles.z_size),' pixels'));
    set(handles.ztext,'String',horzcat('Z: ',num2str(handles.z_pos*handles.z_physical,'%.2f'),' / ',num2str(handles.z_size*handles.z_physical,'%.2f'),' ',handles.z_unit));
    
    % Set intensity information
    if handles.number_channels > 1
        set(handles.intensity_pixel,'String',horzcat('Current pixel: ',num2str(handles.image(x_pos,y_pos,z_pos,1))));
    else
        set(handles.intensity_pixel,'String',horzcat('Current pixel: ',num2str(handles.image(x_pos,y_pos,z_pos))));
    end
    
    % Update view
    update_current_image_view(handles);


% --- Update current image view
function update_current_image_view(handles)
% handles    structure with handles and user data (see GUIDATA)

    % Display on orthogonal view
    if handles.number_channels > 1
        imagesc(handles.xyview, handles.y_vec, handles.x_vec, reshape(handles.image(:,:,handles.z_pos,:),handles.x_size,handles.y_size,handles.number_channels)); % we need to reshape from a 1xAxB dimensional image to AxB to make imagesc accept it
    else
        imagesc(handles.xyview, handles.y_vec, handles.x_vec, handles.image(:,:,handles.z_pos), handles.intensityrange);
    end
    title(handles.xyview, 'XY view');
    xlabel(handles.xyview, horzcat('Y (',handles.y_unit,')')); ylabel(handles.xyview, horzcat('X (',handles.x_unit,')'));
    set(handles.xyview,'XLim',[min(handles.y_vec),max(handles.y_vec)]);
    set(handles.xyview,'YLim',[min(handles.x_vec),max(handles.x_vec)]);
    
    if handles.number_channels > 1
        imagesc(handles.xzview, handles.z_vec, handles.x_vec, reshape(handles.image(:,handles.y_pos,:,:),handles.x_size,handles.z_size,handles.number_channels)); % we need to reshape from a 1xAxB dimensional image to AxB to make imagesc accept it
    else
        imagesc(handles.xzview, handles.z_vec, handles.x_vec, reshape(handles.image(:,handles.y_pos,:),handles.x_size,handles.z_size), handles.intensityrange); % we need to reshape from a 1xAxB dimensional image to AxB to make imagesc accept it
    end
    title(handles.xzview, 'XZ view');
    xlabel(handles.xzview, horzcat('Z (',handles.z_unit,')')); ylabel(handles.xzview, horzcat('X (',handles.x_unit,')'));
    set(handles.xzview,'XLim',[min(handles.z_vec),max(handles.z_vec)]);
    set(handles.xzview,'YLim',[min(handles.x_vec),max(handles.x_vec)]);
    set(handles.xzview,'XDir','reverse');
    
    if handles.number_channels > 1
        imagesc(handles.zyview, handles.y_vec, handles.z_vec, permute(reshape(handles.image(handles.x_pos,:,:,:),handles.y_size,handles.z_size,handles.number_channels),[2,1,3])); % idem
    else
        imagesc(handles.zyview, handles.y_vec, handles.z_vec, reshape(handles.image(handles.x_pos,:,:),handles.y_size,handles.z_size)', handles.intensityrange); % idem
    end
    title(handles.zyview, 'ZY view');
    xlabel(handles.zyview, horzcat('Y (',handles.y_unit,')')); ylabel(handles.zyview, horzcat('Z (',handles.z_unit,')'));
    set(handles.zyview,'XLim',[min(handles.y_vec),max(handles.y_vec)]);
    set(handles.zyview,'YLim',[min(handles.z_vec),max(handles.z_vec)]);
    set(handles.zyview,'YDir','normal');
    
    % Add position cross
    if handles.positioncross
        hold(handles.xyview, 'on');
        plot(handles.xyview, [0,handles.y_size-1].*handles.y_physical,[handles.x_pos-1,handles.x_pos-1].*handles.x_physical,'-y');
        plot(handles.xyview, [handles.y_pos-1,handles.y_pos-1].*handles.y_physical,[0,handles.x_size-1].*handles.x_physical,'-y');
        hold(handles.xyview, 'off');
        hold(handles.xzview, 'on');
        plot(handles.xzview, [0,handles.z_size-1].*handles.z_physical,[handles.x_pos-1,handles.x_pos-1].*handles.x_physical,'-y');
        plot(handles.xzview, [handles.z_pos-1,handles.z_pos-1].*handles.z_physical,[0,handles.x_size-1].*handles.x_physical,'-y');
        hold(handles.xzview, 'off');
        hold(handles.zyview, 'on');
        plot(handles.zyview, [0,handles.y_size-1].*handles.y_physical,[handles.z_pos-1,handles.z_pos-1].*handles.z_physical,'-y');
        plot(handles.zyview, [handles.y_pos-1,handles.y_pos-1].*handles.y_physical,[0,handles.z_size-1].*handles.z_physical,'-y');
        hold(handles.zyview, 'off');
    end
    
    % Add mask
    if ~isempty(handles.mask)
        currentSlice = handles.mask(:,:,handles.z_pos);
        if sum(currentSlice(:) ~= currentSlice(1)) > 0 % To check if we are not trying to display a constant contour (is there a better way to test constantness?)
            hold(handles.xyview, 'on');
            contour(handles.xyview, handles.y_vec, handles.x_vec, currentSlice, [0.5,0.5], '-g');
            hold(handles.xyview, 'off');
        end
        
        currentSlice = reshape(handles.mask(:,handles.y_pos,:),handles.x_size,handles.z_size);
        if sum(currentSlice(:) ~= currentSlice(1)) > 0 % idem
            hold(handles.xzview, 'on');
            contour(handles.xzview, handles.z_vec, handles.x_vec, currentSlice, [0.5,0.5], '-g'); % we need to reshape from a 1xAxB dimensional image to AxB to make imagesc accept it
            hold(handles.xzview, 'off');
        end
        
        currentSlice = reshape(handles.mask(handles.x_pos,:,:),handles.y_size,handles.z_size)';
        if sum(currentSlice(:) ~= currentSlice(1)) > 0 % idem
            hold(handles.zyview, 'on');
            contour(handles.zyview, handles.y_vec, handles.z_vec, currentSlice, [0.5,0.5], '-g'); % idem
            hold(handles.zyview, 'off');
        end
    end
    
