EXTurnCard = {}

local kInAngleZ = 270

local kInDeltaZ = 90

local kOutAngleZ   =   0   

local  kOutDeltaZ  =   90  
EXTurnCard.inCard = nil
EXTurnCard.outCard = nil
EXTurnCard.openAnimIn = nil
EXTurnCard.openAnimOut = nil

function EXTurnCard:create(inCardImageName,outCardImageName,duration)
    local layer = cc.Layer:create()
    inCard = cc.Sprite:create(inCardImageName)
    inCard:setVisible(false)
    layer:addChild(inCard)
    outCard = cc.Sprite:create(outCardImageName)
    layer:addChild(outCard)
    openAnimIn = cc.Sequence:create(cc.DelayTime:create(duration/5),cc.Show:create(),cc.OrbitCamera:create(duration/5, 1, 0, kInAngleZ, kInAngleZ, 0, 0))

    openAnimIn:retain()
--    openAnimOut = cc.Sequence:create(cc.OrbitCamera:create(duration/5, 1, 0, kInAngleZ, kInAngleZ, 0, 0),cc.Hide:create(),cc.DelayTime:create(duration/5))
    openAnimOut = cc.Sequence:create(cc.Hide:create(),cc.DelayTime:create(duration),cc.Show:create())
    
   
    openAnimOut:retain()
    layer.openCard = function() 
--    	 inCard:runAction(openAnimIn)
		 outCard:runAction(openAnimOut)
    end
    return layer
end

function EXTurnCard:openCard()
	self.inCard:runAction(openAnimIn)
	self.outCard:runAction(openAnimOut)
end

return EXTurnCard
