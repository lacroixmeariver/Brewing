-- 6/26/25 Trying to come up with a way of doing the dialogue in one big file and attatching tags and contexts for each NPC


local pd <const> = playdate
local gfx <const> = playdate.graphics
import "pdDialogue"
--import "entities/dialogue"
class("DialogueManager").extends()

function DialogueManager:init()
    self.dialogueData = import "entities/dialogue"
    
end

function DialogueManager:getDialogue(NPCID, context)
    local npcData = self.dialogueData[NPCID]
    
    --print(npcData)
    if not npcData then print("no npc data") return nil
    end
    local lines = npcData[context] or npcData["default"]
    --print(context)
    return lines
    
end

function DialogueManager:speak(NPCID, context)
    local lines = self:getDialogue(NPCID, context)

    -- if lines then 
    --     for i, line in ipairs(lines) do print(line) end 
    --     --print(lines)
    --     pdDialogue.say(line)
    -- end 
    if lines then pdDialogue.say(lines) end
 
    
end


