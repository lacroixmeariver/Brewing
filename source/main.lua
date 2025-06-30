import "Corelibs/object"
import "Corelibs/ui"
import "Corelibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "scenes/menuScreen"
import "roomy-playdate"
import "pdDialogue"
import "DialogueManager"


local pd <const> = playdate
local gfx <const> = playdate.graphics

-- one global declaration 
SCENE_MANAGER = Manager()
SCENE_MANAGER:hook({
    APT = Apartment
})
DIALOGUE_MANAGER = DialogueManager()

-- tags for collisions 
TAGS = {
    ExitZone = 000,
    NPC = 111
}

-- NPC tags to make the unique dialogue easier 
NPCTAGS = {
    dudeOutside = 112
}

SCENE_MANAGER:enter(MainMenu())

function playdate.update()
    SCENE_MANAGER:emit('update')
    gfx.sprite.update()
    pd.timer.updateTimers()
    pdDialogue.update()
    
end



