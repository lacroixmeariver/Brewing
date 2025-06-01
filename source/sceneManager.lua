
-- import "Corelibs/object" 

-- local pd <const> = playdate
-- local gfx <const> = playdate.graphics

-- class("SceneManager").extends()

-- function SceneManager:switchScene(scene)
--     self.newScene = scene
--     self:loadNewScene()
-- end

-- function SceneManager:loadNewScene()
--     self:cleanUpScene()
--     self.newScene()

-- end

-- function SceneManager:cleanUpScene()
--     gfx.sprite.removeAll()
--     self:removeAllTimers()
--     gfx.setDrawOffset(0,0)
-- end

-- function SceneManager:removeAllTimers() -- this is because there doesn't exist a more convenient way 
--     local allTimers = pd.timer.allTimers()
--     for _, timer in ipairs(allTimers) do
--         timer:remove()
--     end
-- end