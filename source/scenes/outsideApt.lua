import "Corelibs/object" 
import "entities/Player"
import "Apartment"
import "ExitZone"
import "entities/NPC"
import "entities/DudeOutside"

local pd <const> = playdate
local gfx <const> = playdate.graphics


class("Outside").extends(Room)

function Outside:enter()
    gfx.sprite.removeAll()
    local backgroundImage = gfx.image.new("assets/homeRoom")
    self.background = gfx.sprite.new(backgroundImage)
    self.background:setZIndex(-100)  
    self.background:moveTo(200, 120) 
    self.background:add()
    self.player = Player(200, 120)
    
    self.exitZone = ExitZone(16, 3, 18, 6, Apartment())
    self.npc = DudeOutside()
   

    

    

end



function Outside:update()
    self.player:update()
    gfx.sprite.update()
    
end
