
local pd <const> = playdate
local gfx <const> = playdate.graphics

class("NPC").extends(gfx.sprite)

function NPC:init(x, y, image, dialogueID)
    local NPCimage = gfx.image.new(image)
    self.NPCSprite = gfx.sprite.new(NPCimage)
    self:setImage(NPCimage)
    self:setTag(TAGS.NPC)
    self:moveTo(x, y)
    self:add()
    self.moveSpeed = 1.5
    self:setCollideRect(0, 0, self:getSize())
    self.uniqueDialogueID = dialogueID
    
    -- self.interaction = nil 
    -- self.canInteract = false
    -- pd.timer.performAfterDelay(500, function()
    -- self.canInteract = true
    -- end) -- dont think i'll need all this but you never know 
    
    
end

function NPC:getUniqueID() 
return self.uniqueDialogueID
end