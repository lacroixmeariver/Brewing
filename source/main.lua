import "Corelibs/object"
import "Corelibs/ui"
import "Corelibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "scenes/menuScreen"
import "roomy-playdate"
--import "Player"

local pd <const> = playdate
local gfx <const> = playdate.graphics

-- one global declaration 
SCENE_MANAGER = Manager()
SCENE_MANAGER:hook()

SCENE_MANAGER:enter(MainMenu())

function playdate.update()
    SCENE_MANAGER:emit('update')
    gfx.sprite.update()
    
end


