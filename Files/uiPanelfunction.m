function uiproperties = uiPanelfunction(parent,backgroundcolor,string,...
                           fontsize,fontweight,foregroundcolor,...
                           position)
    global S
        uiproperties = uipanel(parent,...
                              'BackgroundColor',backgroundcolor,...
                              'Title',          string,...
                              'FontSize',       fontsize,...
                              'FontWeight',     fontweight,...
                              'highlightcolor', foregroundcolor,...
                              'FontUnits',      'Normalized',...
                              'units',          'Centimeters',...
                              'position',       position,...
                              'units',          'Normalized'); 
end

