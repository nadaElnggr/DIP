function [image,GMatrix] = NoInput (image,GMatrix,FString)
  fig = figure('Name','ImageProcessing','Color',[1 1 1],'Position',[250,90,800,500],'MenuBar','none','NumberTitle','off');
  % Create the label
  textString1="";
  labelMessage="plotting "+FString+" Algorithim";
  label = uicontrol(fig,'style','text','string',labelMessage,'Position',[170,450,500,40],'BackgroundColor',[1 1 1],'Fontweight','bold','Fontsize',12,'ForegroundColor', [0.23 0.60 0.73],'FontName','Wide Latin');
  Reset1 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Reset','Position',[50,60,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @Reset);
  Back1 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Back','Position',[250,60,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @Back);
  Histogramm1 = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Histogram','Position',[650,60,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @Histo);
  Savee = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Save','Position',[450,60,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                         'Callback', @export);
  Original = axes(fig,'Position',[0.02 0.3 0.3 0.6],'visible','on','Tag','ax1');
  Enhanced= axes(fig,'Position',[0.35 0.3 0.3 0.6],'visible','on','Tag','ax1');
  Histog = axes(fig,'Position',[0.68 0.3 0.3 0.6],'visible','off','Tag','ax1');
  
  switch FString
      case "Negative"
      output = Negative(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case"Average_Weighted"
      output=Average_Weighted(image);
      GMatrix=output;
      imshow(image,'Parent',Original);
      imshow(GMatrix,'Parent',Enhanced);
      
      case "Sobel"
      output = sobel(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      
      case "Robert"
      output = Robert(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case "Laplacian"
      output = Laplacian(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case "Composite"
      output = CompositeFilter(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case "AND"
      output = ANDMask(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case "OR"
      output = ORMask(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case "MIN"
      output = Min(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case "MAX"
      output = Max(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      case "HistogramEqualization"
      output = HistogramEqualization(GMatrix);
      GMatrix=output;
      title('Original Image');
      imshow(image,'Parent',Original);
      title('Enhanced');
      imshow(GMatrix,'Parent',Enhanced);
      
      
  end
  function Back(hObject,eventdata)
      Spatial(image,GMatrix);
      close(fig);
  end

  function export(hObject,eventdata)
         [file, path] = uiputfile('*.jpg', 'Save processed image as *.jpg');
         imwrite(GMatrix, fullfile(path, file));
  end

  function Histo(hObject,eventdata)
      counts=Histogram(GMatrix);
      grayLevels = 0 : 255;
      bar(Histog ,grayLevels, counts, 'BarWidth', 5, 'FaceColor', 'b');
      xlabel('Gray Level', 'FontSize', 10);
      ylabel('Pixel Count', 'FontSize', 10);
      grid on;
  end

  function Reset(hObject,eventdata)
    GMatrix=image;
    message = sprintf("Your image is resetted to the original image succefully ! ");
    uiwait(msgbox(message));
  end
end