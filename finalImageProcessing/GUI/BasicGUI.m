function [image,GMatrix] = BasicGUI(image,GMatrix,FString)
  % Create the figure window with the specified properties
  fig = figure('Name','ImageProcessing','Color',[1 0.95 0.86],'Position',[250,90,800,500],'MenuBar','none','NumberTitle','off');
  % Create the label
  textString="";
  labelMessage="plotting "+FString+" Algorithim";
  TextField1 = uicontrol(fig,'style','edit','enable','on','Position',[540,400,250,30],'Tag','txt'); 
  label = uicontrol(fig,'style','text','string',labelMessage,'Position',[170,450,500,40],'BackgroundColor',[1 0.95 0.86],'Fontweight','bold','Fontsize',15,'ForegroundColor', [0.23 0.60 0.73],'FontName','Wide Latin');
  Submit1 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'SubmitImage','Position',[690,360,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @SubmitImage);
  Submit2 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'SubmitInput','Position',[540,360,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @SubmitInput);
  Submit3 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Apply','Position',[690,320,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @Apply);
  Backk = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Back','Position',[540,280,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @Back);
  Histogramm1 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Histogram','Position',[540,320,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                         'Callback', @Histo);
  Savee = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Save','Position',[613,240,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                         'Callback', @export);
  Reset1 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Reset','Position',[690,280,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @Reset);
  Original = axes(fig,'Position',[0.02 0.3 0.3 0.6],'visible','off','Tag','ax1');
  Enhanced= axes(fig,'Position',[0.35 0.3 0.3 0.6],'visible','off','Tag','ax1');
  Histog = axes(fig,'Position',[0.68 0.04 0.3 0.4],'visible','off','Tag','ax1');
  display_path="";
  NumericInput=0;
  function SubmitImage(hObject,eventdata)
        [filename,pathname]=uigetfile('*','select your ecg signal');
        display_path = strcat(pathname,filename);
        TextField1.String=display_path;
        message=sprintf('Your image is added succefully !');
        uiwait(msgbox(message));
        
  end
   
  function Back(hObject,eventdata)
      Spatial(image,GMatrix);
      close(fig);
  end

% Define the callback function for the buttons
function Apply(hObject,eventdata)
    switch FString
        case "Average_Simple"
        if(rem(NumericInput,2) ~= 0)
        output =Average_Simple(GMatrix,NumericInput);
        GMatrix=output;
        title('Original Image');
        imshow(image,'Parent',Original);
        title('Enhanced');
        imshow(GMatrix,'Parent',Enhanced);
        end
        if(rem(NumericInput,2) == 0)
        message = sprintf("Mask size must be odd");
        uiwait(msgbox(message));
        end
        
        case "Median"
        if(rem(NumericInput,2) ~= 0)
        output =Median(GMatrix,NumericInput);
        GMatrix=output;
        title('Original Image');
        imshow(image,'Parent',Original);
        title('Enhanced');
        imshow(GMatrix,'Parent',Enhanced);
        end
        if(rem(NumericInput,2) == 0)
        message = sprintf("Mask size must be odd");
        uiwait(msgbox(message));
        end
        
        
        case "log"
        output = Log(GMatrix,NumericInput);
        GMatrix=output;
        title('Original Image');
        imshow(image,'Parent',Original);
        title('Enhanced');
        imshow(GMatrix,'Parent',Enhanced);

      
        case "power"
        output=PowerFunctions(GMatrix,NumericInput);
        GMatrix=output;
        imshow(image,'Parent',Original);
        imshow((GMatrix),[],'Parent',Enhanced);

        case "Add a number"
        if NumericInput >=1
        output=AddingValue(GMatrix,NumericInput);
        GMatrix=output;
        imshow(image,'Parent',Original);
        imshow(GMatrix,'Parent',Enhanced);
        end
        if NumericInput<1
        message = sprintf("Your enter must be positive , submit another positive number");
        uiwait(msgbox(message));
        end

        case "Subtract a number"
        if NumericInput >=1
        output=SubtractValue(GMatrix,NumericInput);
        GMatrix=output;
        imshow(image,'Parent',Original);
        imshow(GMatrix,'Parent',Enhanced);
        end
        if NumericInput<1
        message = sprintf("Your enter must be positive , submit another positive number");
        uiwait(msgbox(message));
        end


        case "Inverse Log"
        output = InverseLog(GMatrix,NumericInput);
        GMatrix=output;
        title('Original Image');
        imshow(image,'Parent',Original);
        title('Enhanced');
        imshow(GMatrix,'Parent',Enhanced);
        
        case "Thresholding"
        output = Thresholding(GMatrix,NumericInput);
        GMatrix=output;
        title('Original Image');
        imshow(image,'Parent',Original);
        title('Enhanced');
        imshow(GMatrix,'Parent',Enhanced);
        
        case "Resampling"
        output = ResamplingUp(GMatrix,NumericInput);
        GMatrix=output;

        case "SubSampling"
        if NumericInput >1
        output=SubSampling(GMatrix,NumericInput);
        GMatrix=output;
        title('Original Image');
        imshow(image,'Parent',Original);
        title('Enhanced');
        imshow(GMatrix,'Parent',Enhanced);
        end
        if NumericInput<=1
        message = sprintf("Your enter must be positive , submit another positive number");
        uiwait(msgbox(message));
        end

      
    
    end
end

  function SubmitInput(hObject,eventdata)
         textString = get(TextField1,'String');
         NumericInput=str2double(textString);
         message = sprintf("Your enter "+textString+" is submitted succefully ! ");
         uiwait(msgbox(message));
  end
 function Histo(hObject,eventdata)
      counts=Histogram(GMatrix);
      grayLevels = 0 : 255;
      bar(Histog ,grayLevels, counts, 'BarWidth', 5, 'FaceColor', 'b');
      xlabel('Gray Level', 'FontSize', 10);
      ylabel('Pixel Count', 'FontSize', 10);
      grid on;
 end
 function export(hObject,eventdata)
         [file, path] = uiputfile('*.jpg', 'Save processed image as *.jpg');
        imwrite(GMatrix, fullfile(path, file));
 end

 function Reset(hObject,eventdata)
    GMatrix=image;
    message = sprintf("Your image is resetted to the original image succefully ! ");
    uiwait(msgbox(message));
 end

  
end