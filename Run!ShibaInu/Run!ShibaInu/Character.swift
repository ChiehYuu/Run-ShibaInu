//
//  character.swift
//  Run!ShibaInu
//
//  Created by Jay on 2016/8/10.
//  Copyright © 2016年 Jay. All rights reserved.
//

import SpriteKit

class Character: SKSpriteNode {
    
    /* Character Side */
    var side: Side = .Left{
        didSet {
            if side == .Left {
                position.x = 50
            } else if side == .Middle {
                position.x = 160
            } else {
                position.x = 270
            }
        }
    }
    
    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
    
    
}
