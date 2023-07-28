function [image,GMatrix] = MAIN
  % Create the figure window with the specified properties
  fig = figure('Name','ImageProcessing','Color',[1 0.95 0.86],'Position',[350,70,600,400],'MenuBar','none','NumberTitle','off');
  % Create the label
  label = uicontrol(fig,'style','text','string','This application for image processing','Position',[100,350,400,40],'BackgroundColor',[1 0.95 0.86],'Fontweight','bold','Fontsize',12,'ForegroundColor', [0.23 0.60 0.73],'FontName','Wide Latin');
  TextField1 = uicontrol(fig,'style','edit','enable','off','Position',[150,250,300,30],'Tag','txt'); 
  % Create the first button
  Button = uicontrol(fig,'style','pushbutton','Callback',@EnterImage,'String','Submit','Position',[370,250,100,30],'BackgroundColor',[0.23 0.60 0.73],'ForegroundColor', [1 0.95 0.86],'FontSize', 12,'FontName', 'Times New Roman');
  btn1 = uicontrol(fig, 'Style', 'pushbutton','String','Spatial Domain','Position', [350,100,150,50],'BackgroundColor', [0.23 0.60 0.73],'ForegroundColor', [1 0.95 0.86],'FontSize', 12,'FontName', 'Times New Roman','HorizontalAlignment', 'center','Callback', @SpatialFunction);    
  btn2 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Frequency Domain','Position',[100,100,150,50],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @FrequencyFunction);
  % Calculate the horizontal position of the buttons
  buttonX = (600 - (150*2 + 80))/2;

  % Adjust the positions of the buttons to center them below the label
  button1.Position(1) = buttonX;
  button2.Position(1) = buttonX + 150 + 80;

  % Add spacing between the buttons
  button2.Position(1) = button2.Position(1) + 50;

    function EnterImage(hObject,eventdata)
        [filename,pathname]=uigetfile('*','select your photo');
        display_path = strcat(pathname,filename);
        TextField1.String=display_path;
        image=imread(display_path);
        GMatrix=image;
        figure;
        imshow(image);
    end
   
    function SpatialFunction(hObject,eventdata)
        Spatial(image,GMatrix);
        close(fig);
    end
    
    function FrequencyFunction(hObject,eventdata)
        Frequency(image,GMatrix);
        close(fig);
     end
    
end

