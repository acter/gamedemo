require("TestTurnCard.EXTurnCard")
local TestTurnCard = class("TestTurnCard",function()
    return cc.Scene:create()
end)
function TestTurnCard:create()
    local scene = TestTurnCard.new()
    scene:addChild(scene:createLayer())
    self = scene
    return scene
end

function TestTurnCard:createLayer()
    local layer = cc.Layer:create()
    local size = cc.Director:getInstance():getWinSize()
    local turnCard = EXTurnCard:create("2.jpg", "1.jpg", 1)
    turnCard:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(turnCard)
    turnCard:openCard()
--    
--    local turnCard2 = EXTurnCard:create("2.jpg", "1.jpg", 1)
--    turnCard2:setPosition(cc.p(size.width/3,size.height/5))
--    layer:addChild(turnCard2)
--    turnCard2:openCard()
--    
    return layer
end

return TestTurnCard