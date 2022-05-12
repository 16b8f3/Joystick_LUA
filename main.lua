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

local direcaoA = 0;
local direcaoB = 0;

local function moveDiagonal(posicao)
	if ( ( posicao.x > 110 and posicao.x < 210 ) and ( posicao.y > 190 and posicao.y < 290 ) ) then
		direcaoA = 0;
		direcaoB = 0;
	else
		if (posicao.phase == "began") then
			bola:setFillColor(22/255, 184/255, 243/255);
			bola:setStrokeColor( 255/255,255/255,255/255 );
			-- Area 1
			if ( ( posicao.x > 0 and posicao.x < 160 ) and ( posicao.y > 0 and posicao.y < 240 ) ) then
				direcaoA = -1;
				direcaoB = -1.5;
			-- Area 2
			elseif ( ( posicao.x > 160 and posicao.x < 320 ) and ( posicao.y > 0 and posicao.y < 240 ) ) then
				direcaoA = 1;
				direcaoB = -1.5;
			-- Area 3
			elseif ( ( posicao.x > 0 and posicao.x < 160 ) and ( posicao.y > 240 and posicao.y < 480 ) ) then
				direcaoA = -1;
				direcaoB = 1.5;
			-- Area 4
			elseif ( ( posicao.x > 160 and posicao.x < 320 ) and ( posicao.y > 240 and posicao.y < 480 ) ) then
				direcaoA = 1;
				direcaoB = 1.5;
			end
		elseif ( posicao.phase == "ended" ) then
			bola:setFillColor( 255/255,255/255,255/255 );
			bola.strokeWidth = 2;
			bola:setStrokeColor(22/255, 184/255, 243/255);
			direcaoA = 0;
			direcaoB = 0;
		end
	end
end

local function onEnterFrame( ev )
	Runtime:addEventListener("touch", moveDiagonal);
	if (direcaoA ~= 0) then
		bola.x = bola.x + direcaoA;
	end
	if (direcaoB ~= 0) then
		bola.y = bola.y + direcaoB;
	end
end
Runtime:addEventListener("enterFrame", onEnterFrame);
