
local pd <const> = playdate
local gfx <const> = playdate.graphics
import "NPC"

class("Player").extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new("assets/testPlayer")
    self.playerSprite = gfx.sprite.new(playerImage)
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()
    self.moveSpeed = 1.5
    self:setCollideRect(0, 0, self:getSize())
    self.interaction = nil
    self.canInteract = false
    pd.timer.performAfterDelay(500, function()
    self.canInteract = true
    end)

end

-- custom response to a player colliding with something 
function Player:collisionResponse(other)
    if other:isa(ExitZone) then
        self.interaction = other
        return "overlap"
    end 
    if other:isa(NPC) then
        self.interaction = other.uniqueDialogueID
        --print("Colliding with NPC")
        --print(self.interaction)
        
        return "overlap"
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

    self.interaction = nil

    -- no calls if the player has not moved 
    if playerX ~= 0 or playerY ~= 0 then
        self:moveWithCollisions(self.x + playerX, self.y + playerY)
    end

    local _,_, collisions, numberOfCollisions = self:moveWithCollisions(self.x + playerX, self.y + playerY) 
        for i=1, numberOfCollisions do
            local collision = collisions[i]
            local collidedSprite = collision.other
            local collisionTag = collidedSprite:getTag()
            
            if collisionTag == TAGS.ExitZone and pd.buttonJustPressed(pd.kButtonA) and self.canInteract then 
                --print("Overlapping")
                SCENE_MANAGER:enter(self.interaction.targetRoom)
                
            end 
            if collisionTag == TAGS.NPC and pd.buttonJustPressed(pd.kButtonA) and self.canInteract then
                DIALOGUE_MANAGER:speak(self.interaction, "default")
                
                
            end
        end

end

