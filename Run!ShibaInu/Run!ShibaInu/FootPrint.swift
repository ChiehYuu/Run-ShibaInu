//
//  FootPrint.swift
//  Run!ShibaInu
//
//  Created by Jay on 2016/8/9.
//  Copyright © 2016年 Jay. All rights reserved.
//

import SpriteKit

class FootPrint: SKSpriteNode {
    
    /* Footprint Objects */
    var MidFootPrint: SKSpriteNode!
    var LeftFootPrint: SKSpriteNode!
    var RightFootPrint: SKSpriteNode!
    
    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func connectFootPrint() {
        
        /* Connect the child footprint nodes */
        self.MidFootPrint = childNodeWithName("MidFootPrint") as! SKSpriteNode
        self.LeftFootPrint = childNodeWithName("LeftFootPrint") as! SKSpriteNode
        self.RightFootPrint = childNodeWithName("RightFootPrint") as! SKSpriteNode
        
        /* Set the default side */
        side = .Middle
        
    }
    
    var side: Side = .Middle {
        
        didSet {
            switch side {
            case .Left:
                /* Show left footprint */
                LeftFootPrint.hidden = false
            case .Right:
                /* Show right footprint */
                RightFootPrint.hidden = false
            case .Middle:
                /* Show middle footprint */
                LeftFootPrint.hidden = true
                RightFootPrint.hidden = true
            }
            
        }
    }
    
    
    
}