
import "Corelibs/object" 
import "outsideApt"

-- this game over screen is to be replaced with the actual starting game scene 
-- this was mostly for testing 
local pd <const> = playdate
local gfx <const> = playdate.graphics

class("MainMenu").extends(Room)

function MainMenu:enter()
    local menuImage = gfx.image.new("assets/mainMenu")
    self.background = gfx.sprite.new(menuImage)
    self.background:setZIndex(-200)  
    self.background:moveTo(200, 120) 
    self.background:add()
    
    
end



function MainMenu:update()
    if pd.buttonJustPressed(pd.kButtonA) then 
        SCENE_MANAGER:enter(Apartment())
    end
end