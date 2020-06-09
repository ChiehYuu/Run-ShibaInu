//
//  FootPrintFalling.swift
//  Run!ShibaInu
//
//  Created by Jay on 2016/8/11.
//  Copyright © 2016年 Jay. All rights reserved.
//

import SpriteKit

class FootPrintFalling: SKSpriteNode {
    
    /* FootPrint Objects */
    var RightFootPrint: SKSpriteNode!
    var MidFootPrint: SKSpriteNode!
    var LeftFootPrint: SKSpriteNode!
    
    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func connectFootPrint(){
        RightFootPrint = childNodeWithName("RightFootPrint") as! SKSpriteNode
        MidFootPrint = childNodeWithName("MidFootPrint") as! SKSpriteNode
        LeftFootPrint = childNodeWithName("LeftFootPrint") as! SKSpriteNode
        
        /* Set the default side */
        side = .None
    }
    
    var side :Side = .None {
        
        didSet {
            switch side {
            case .Left:
                /* Show left footprint */
                LeftFootPrint.hidden = false
            case .Right:
                /* Show right footprint */
                RightFootPrint.hidden = false
            case .Middle:
                /* show middle footprint */
                MidFootPrint.hidden = false
            case .None:
                /* Hide all footprint */
                LeftFootPrint.hidden = true
                MidFootPrint.hidden = true
                RightFootPrint.hidden = true
            }
            
        }
    }
    
       
    
    
    
}
