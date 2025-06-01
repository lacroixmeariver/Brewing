import "Corelibs/object" 
import "Player"
import "TestRoom2"

local pd <const> = playdate
local gfx <const> = playdate.graphics

class("Bedroom").extends(Room)

function Bedroom:enter()
    local backgroundImage = gfx.image.new("assets/homeRoom")
    self.background = gfx.sprite.new(backgroundImage)
    self.background:setZIndex(-100)  
    self.background:moveTo(200, 120) 
    self.background:add()
    self.player = Player(200, 120)

end

function Bedroom:checkIfExit()
    local pX, pY = self.player:getPosition()
    print(pX, pY)
    if ((pX < 0 or pX > 400) and (pY > 240 or pY < 240)) then 
        SCENE_MANAGER:enter(TestRoom2())
    end
end

function Bedroom:update()
    self.player:update()
    gfx.sprite.update()
    self:checkIfExit()
end
