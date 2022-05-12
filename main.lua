-- Ocultando barra de Status
display.setStatusBar(display.HiddenStatusBar);

-- Variavel Global de Largura
_w = display.viewableContentWidth;
-- Variavel Global de Altura
_h = display.viewableContentHeight;

-- Area 1
local area1 = display.newRect( 0, 0, 320, 480 );
area1:setFillColor(31/255, 130/255, 160/255);

-- Area 2
local area2 = display.newRect( _w, 0, 320, 480 );
area2:setFillColor(242/255, 46/255, 92/255);

-- Area 3
local area3  = display.newRect( 0, _h, 320, 480 );
area3:setFillColor(242/255, 229/255, 46/255);

-- Area 4
local area4  = display.newRect( _w, _h, 320, 480 );
area4:setFillColor(166/255, 155/255, 7/255);

-- Descanso
local descanso = display.newRect( _w/2, _h/2, 100, 100 );
descanso:setFillColor(22/255, 184/255, 243/255);

-- bola
local bola = display.newCircle( _w/2, _h/2, 18 );
bola:setFillColor( 255/255,255/255,255/255 );
bola.strokeWidth = 2;
bola:setStrokeColor(22/255, 184/255, 243/255);