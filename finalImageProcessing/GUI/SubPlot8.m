function SubPlot8 (image,GMatrix,FString)
  fig = figure('Name','ImageProcessing','Color',[1 1 1],'Position',[250,90,800,500],'MenuBar','none','NumberTitle','off');
  % Create the label
  labelMessage="plotting "+FString+" Algorithim";
  label = uicontrol(fig,'style','text','string',labelMessage,'Position',[170,450,500,40],'BackgroundColor',[1 1 1],'Fontweight','bold','Fontsize',12,'ForegroundColor', [0.23 0.60 0.73],'FontName','Wide Latin');
  Backk = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Back','Position',[700,20,100,30],'BackgroundColor', [0.23 0.60 0.73], ...
                        'ForegroundColor', [1 0.95 0.86], ...
                        'FontSize', 12,...
                        'FontName', 'Times New Roman',...
                        'HorizontalAlignment', 'center', ...
                        'Callback', @Back);
 
  function Back(hObject,eventdata)
      Spatial(image,GMatrix);
      close(fig);
  end
  switch FString
    case "Graylevel8"
    imagelist = GrayLevel8(image);
    
    case "BitPlaneSlicing"
    imagelist = BitPlaneSlicing(image);
  end
  One = axes(fig,'Position',[0.023 0.6 0.2 0.3],'visible','on','Tag','ax1','title','One');
  Two = axes(fig,'Position',[0.28 0.6 0.2 0.3],'visible','on','Tag','ax1');
  Three = axes(fig,'Position',[0.55 0.6 0.2 0.3],'visible','on','Tag','ax1');
  Four = axes(fig,'Position',[0.79 0.6 0.2 0.3],'visible','on','Tag','ax1');
  Five = axes(fig,'Position',[0.023 0.15 0.2 0.3],'visible','on','Tag','ax1');
  Six = axes(fig,'Position',[0.28 0.15 0.2 0.3],'visible','on','Tag','ax1');
  Seven = axes(fig,'Position',[0.55 0.15 0.2 0.3],'visible','on','Tag','ax1');
  Eight = axes(fig,'Position',[0.79 0.15 0.2 0.3],'visible','on','Tag','ax1');
  
  imshow(imagelist{1},'Parent',One);
  imshow(imagelist{2},'Parent',Two);
  imshow(imagelist{3},'Parent',Three);
  imshow(imagelist{4},'Parent',Four);
  imshow(imagelist{5},'Parent',Five);
  imshow(imagelist{6},'Parent',Six);
  imshow(imagelist{7},'Parent',Seven);
  imshow(imagelist{8},'Parent',Eight);
  
end