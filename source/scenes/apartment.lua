import "Corelibs/object" 
import "entities/Player"
import "ExitZone"
import "OutsideApt"


local pd <const> = playdate
local gfx <const> = playdate.graphics

class("Apartment").extends(Room)

function Apartment:enter()
    gfx.sprite.removeAll()
    local backgroundImage = gfx.image.new("assets/apartment")
    self.background = gfx.sprite.new(backgroundImage)
    self.background:setZIndex(-100)  
    self.background:moveTo(200, 120) 
    self.background:add()
    self.player = Player(64,100)
    --self.player:setZIndex(1000)
    
    self.exitZone = ExitZone(64, 75, 30, 40, Outside()) -- x,y, width, height
    

    
   


end

function Apartment:update()
    self.player:update()
    gfx.sprite.update()
end
