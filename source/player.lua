
local pd <const> = playdate
local gfx <const> = playdate.graphics

class("Player").extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new("assets/testPlayer")
    self.playerSprite = gfx.sprite.new(playerImage)
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()
    self.moveSpeed = 3
    self:setCollideRect(0, 0, self:getSize())
    

end


function Player:update()

    if pd.buttonIsPressed(pd.kButtonUp) then
        self:moveBy(0, -1 * self.moveSpeed) 
    end
    if pd.buttonIsPressed(pd.kButtonDown) then
        self:moveBy(0, 1 * self.moveSpeed) 
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self:moveBy(-1 * self.moveSpeed, 0) 
    end
    if pd.buttonIsPressed(pd.kButtonRight) then
        self:moveBy(1 * self.moveSpeed, 0) 
    end

    local x, y = self:getPosition()
    print(x, y)
    

end