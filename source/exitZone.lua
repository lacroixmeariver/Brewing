
local pd <const> = playdate
local gfx <const> = playdate.graphics

class("ExitZone").extends(gfx.sprite)
 
function ExitZone:init(x, y, width, height, targetRoom)
    self.targetRoom = targetRoom
    self:setSize(width, height)
    self:setCollideRect(0, 0, width, height)
    self:setTag(100)
    self:moveTo(x, y)
    self:add()

end