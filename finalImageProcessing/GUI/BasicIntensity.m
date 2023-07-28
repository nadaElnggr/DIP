function BasicIntensity(image,GMatrix)
% Create a new figure
fig = figure('Name','BasicIntensity','Color',[1 0.95 0.86],'Position',[350,100,600,400],'MenuBar','none','NumberTitle','off');
% Create the label
label = uicontrol(fig,'style','text','string','BasicIntensity','Position',[35,530,400,40],'BackgroundColor',[1 0.95 0.86],'Fontweight','bold','Fontsize',12,'ForegroundColor', [0.23 0.60 0.73],'FontName','Wide Latin');

% Define the background and font colors
bg_color = [0.23 0.60 0.73];
font_color = [1 0.95 0.86];

% Define the button size and spacing
btn_width = 120;
btn_height = 60;
btn_spacing = 70;

% Define the number of rows and columns
num_rows = 4;
num_cols = 2;

% Calculate the total figure width and height
fig_width = num_cols * (btn_width + btn_spacing) + btn_spacing;
fig_height = num_rows * (btn_height + btn_spacing) + btn_spacing;

% Set the figure size
fig.Position(3:4) = [fig_width, fig_height];

% Create the buttons and assign callback functions
for row = 1:num_rows
    for col = 1:num_cols
        % Calculate the button position
        x_pos = btn_spacing + (col-1) * (btn_width + btn_spacing);
        y_pos = btn_spacing  + (num_rows - row) * (btn_height + btn_spacing);
        
        % Create the button
        btn = uicontrol(fig, 'Style', 'pushbutton', ...
                        'String', setString((row-1)*num_cols+col), ...
                        'Position', [x_pos, y_pos, btn_width, btn_height], ...
                        'BackgroundColor', bg_color, ...
                        'ForegroundColor', font_color, ...
                        'HorizontalAlignment', 'center', ...
                        'Fontweight','bold','Fontsize',12,'FontName','Times New Roman',...
                        'Callback', {@buttonCallback, (row-1)*num_cols+col});
    end
end
function [string] =setString(button_number)
switch(button_number)
    case 1
        string = "NegativeImage";
    case 2
        string = "Log";
    case 3
        string ="InverseLog";
    case 4
        string="PowerFunctions";
    case 5
        string ="Back";
    case 6 
        string ="Reset";
    case 7
        string ="Save";
    case 8
        string ="Close";
        
end
end

% Define the callback function for the buttons
function buttonCallback(~, ~, button_number)
    switch button_number
    case 1
        NoInput(image,GMatrix,"Negative");
        close(fig);
    case 2
        BasicGUI(image,GMatrix,"log");
        close(fig);
    case 3
        BasicGUI(image,GMatrix,"Inverse Log");
        close(fig);
        % out=InverseLog(GMatrix);
        % GMatrix=out;
        % plotFigure(image,GMatrix);
        % close(fig);
    case 4
        BasicGUI(image,GMatrix,"power");
        close(fig);
    case 5
        Spatial;
        close(fig);
    case 6
        GMatrix=image;
        message = sprintf("Your image is resetted to the original image succefully ! ");
        uiwait(msgbox(message));
    case 7
        [file, path] = uiputfile('*.jpg', 'Save processed image as *.jpg');
        imwrite(GMatrix, fullfile(path, file));
    case 8
        close(fig);
    otherwise
        disp('Invalid random number');
    end
    end
end