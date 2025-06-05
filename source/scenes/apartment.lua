import "Corelibs/object" 
import "Player"
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
    self.player = Player(200,120)
    self.player:setZIndex(1000)
    
    self.exitZone = ExitZone(50, 50, 24, 24, Outside())
end

function Apartment:update()
    self.player:update()
    gfx.sprite.update()
end
