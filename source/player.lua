
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

function Player:collisionResponse(other)
    if other:getTag() == 100 and other.targetRoom then
        print("Switching to room:", other.targetRoom)
        SCENE_MANAGER:enter(other.targetRoom)
    end
    return "overlap"
end

function Player:update()

    
    local playerX, playerY = 0, 0

    if pd.buttonIsPressed(pd.kButtonUp) then
        playerY -= self.moveSpeed
    end
    if pd.buttonIsPressed(pd.kButtonDown) then
        playerY += self.moveSpeed
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        playerX -= self.moveSpeed
    end
    if pd.buttonIsPressed(pd.kButtonRight) then
        playerX += self.moveSpeed
    end

    -- no calls if the player has not moved 
    if playerX ~= 0 or playerY ~= 0 then
        self:moveWithCollisions(self.x + playerX, self.y + playerY)
    end
end

