import "Corelibs/object" 
import "Player"


local pd <const> = playdate
local gfx <const> = playdate.graphics

class("TestRoom2").extends(Room)

function TestRoom2:enter()
    gfx.sprite.removeAll()
    local backgroundImage = gfx.image.new("assets/testRoom2")
    self.background = gfx.sprite.new(backgroundImage)
    self.background:setZIndex(-100)  
    self.background:moveTo(200, 120) 
    self.background:add()
    self.player = Player(0,0)
    

end

function TestRoom2:update()
    self.player:update()
    gfx.sprite.update()
end
