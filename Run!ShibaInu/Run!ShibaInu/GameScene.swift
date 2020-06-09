//
//  GameScene.swift
//  Run!ShibaInu
//
//  Created by Jay on 2016/8/8.
//  Copyright (c) 2016年 Jay. All rights reserved.
//

import SpriteKit

/* Tracking enum for use with character and footprint side */

enum Side {
    case Left ,Right ,Middle ,None
}

/* Tracking enum for game state */
enum GameState {
    case Title, Ready, Playing, GameOver
}

/* Main function for gaming */
class GameScene: SKScene {
    
    var FootPrintBase: FootPrintFalling!
    var character: Character!
    var playButton: MSButtonNode!
    var PlayAgainButton: MSButtonNode!
    var TutorialButton: MSButtonNode!
    var NextButton: MSButtonNode!
    var ShadowGameStart: SKSpriteNode!
    var character_losing: SKSpriteNode!
    var GameOverButton: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var TimeArrow: SKSpriteNode!
    var ShadowGameOver: SKSpriteNode!
    
    
    
    /* Variable of shadow of Tutorial */
    var ShadowTutorial1: SKSpriteNode!
    var ShadowTutorial2: SKSpriteNode!
    var ShadowTutorial3: SKSpriteNode!
    var ShadowTutorial4: SKSpriteNode!
    var ShadowTutorial5: SKSpriteNode!
    
    /* Variable of Tutorial of character */
    var PointArrowCharacter: SKSpriteNode!
    var TextCharacter1: SKLabelNode!
    var TextCharacter2: SKLabelNode!
    var TextCharacter3: SKLabelNode!
    
    /* Variable of Tutorial of Scoring */
    var PointArrowScore: SKSpriteNode!
    var TextScore1: SKLabelNode!
    var TextScore2: SKLabelNode!
    var TextScore3: SKLabelNode!
    
    /* Variable of Tutorial of Time */
    var PointArrowTime: SKSpriteNode!
    var TextTime1: SKLabelNode!
    var TextTime2: SKLabelNode!
    var TextTime3: SKLabelNode!
    
    /* Variable of Tutorial of Story */
    var CharacterInstroction: SKSpriteNode!
    var DialogueCloud: SKSpriteNode!
    var StoryTutorial1: SKLabelNode!
    var StoryTutorial2: SKLabelNode!
    var StoryTutorial3: SKLabelNode!
    var StoryTutorial4: SKLabelNode!
    var StoryTutorial5: SKLabelNode!
    
    /* Variable of Tutorial of StartPage */
    var TextStart: SKLabelNode!
    
    
    
    
    
    
    
    
    /* Footprint tower array */
    var FootPrintTower: [FootPrintFalling] = []
    
    /* Game management */
    var state: GameState = .Title
    
    /* Score Update */
    var score: Int = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    
    /* Time count down Setting */
    var time: CGFloat = 1.0 {
        didSet {
            /* Scale Time Arrow between 0.0 -> 1.0 e.g 0 -> 100% */
            TimeArrow.xScale = time
        }
    }
    
    override func didMoveToView(view: SKView) {
        
        /* Connect game FootPrintBase */
        FootPrintBase = childNodeWithName("FootPrintBase") as! FootPrintFalling
        
        /* Setup the FootPrint Connections */
        FootPrintBase.connectFootPrint()
        
        /* Connect game Character */
        character = childNodeWithName("character") as! Character
        
        /* Connect game StartButton */
        playButton = childNodeWithName("playButton") as! MSButtonNode
        
        /* Connect game TutorialButton */
        TutorialButton = childNodeWithName("TutorialButton") as! MSButtonNode
        
        /* Connect game NextButton */
        NextButton = childNodeWithName("NextButton") as! MSButtonNode
        
        /* Connect game Shadow For GameStart */
        ShadowGameStart = childNodeWithName("ShadowGameStart") as! SKSpriteNode
        
        /* Connect game Character_losing */
        character_losing = childNodeWithName("character_losing") as! SKSpriteNode
        
        /* Connect game GameOverButton */
        GameOverButton = childNodeWithName("GameOverButton") as! SKSpriteNode
        
        /* Connect game PlayAgainButton */
        PlayAgainButton = childNodeWithName("PlayAgainButton") as! MSButtonNode
        
        /* Connect game scoreLabel */
        scoreLabel = childNodeWithName("scoreLabel") as! SKLabelNode
        
        /* Connect game Timer Arrow */
        TimeArrow = childNodeWithName("TimeArrow") as! SKSpriteNode
        
        /* Connect game Shadow For GameOver */
        ShadowGameOver = childNodeWithName("ShadowGameOver") as! SKSpriteNode
        
        /* Connect game Shadow For Tutorial */
        ShadowTutorial1 = childNodeWithName("ShadowTutorial1") as! SKSpriteNode
        ShadowTutorial2 = childNodeWithName("ShadowTutorial2") as! SKSpriteNode
        ShadowTutorial3 = childNodeWithName("ShadowTutorial3") as! SKSpriteNode
        ShadowTutorial4 = childNodeWithName("ShadowTutorial4") as! SKSpriteNode
        ShadowTutorial5 = childNodeWithName("ShadowTutorial5") as! SKSpriteNode
       
        /* Connect game tutorial things in Tutorial2 */
        PointArrowCharacter = ShadowTutorial2.childNodeWithName("PointArrowCharacter") as! SKSpriteNode
        TextCharacter1 = ShadowTutorial2.childNodeWithName("TextCharacter1") as! SKLabelNode
        TextCharacter2 = ShadowTutorial2.childNodeWithName("TextCharacter2") as! SKLabelNode
        TextCharacter3 = ShadowTutorial2.childNodeWithName("TextCharacter3") as! SKLabelNode
        
        /* Connect game tutorial things in Tutorial3 */
        PointArrowScore = ShadowTutorial3.childNodeWithName("PointArrowScore") as! SKSpriteNode
        TextScore1 = ShadowTutorial3.childNodeWithName("TextScore1") as! SKLabelNode
        TextScore2 = ShadowTutorial3.childNodeWithName("TextScore2") as! SKLabelNode
        TextScore3 = ShadowTutorial3.childNodeWithName("TextScore3") as! SKLabelNode
        
        /* Connect game tutorial things in Tutorial4 */
        PointArrowTime = ShadowTutorial4.childNodeWithName("PointArrowTime") as! SKSpriteNode
        TextTime1 = ShadowTutorial4.childNodeWithName("TextTime1") as! SKLabelNode
        TextTime2 = ShadowTutorial4.childNodeWithName("TextTime2") as! SKLabelNode
        TextTime3 = ShadowTutorial4.childNodeWithName("TextTime3") as! SKLabelNode
        
        /* Connect game tutorial things in Tutorial1 */
        CharacterInstroction = ShadowTutorial1.childNodeWithName("CharacterInstroction") as! SKSpriteNode
        StoryTutorial1 = ShadowTutorial1.childNodeWithName("StoryTutorial1") as! SKLabelNode
        StoryTutorial2 = ShadowTutorial1.childNodeWithName("StoryTutorial2") as! SKLabelNode
        StoryTutorial3 = ShadowTutorial1.childNodeWithName("StoryTutorial3") as! SKLabelNode
        StoryTutorial4 = ShadowTutorial1.childNodeWithName("StoryTutorial4") as! SKLabelNode
        StoryTutorial5 = ShadowTutorial1.childNodeWithName("StoryTutorial5") as! SKLabelNode
        
        /* Connect game tutorial thing in Tutorial5 */
        TextStart = ShadowTutorial5.childNodeWithName("TextStart") as! SKLabelNode
        
        
        /* Conceal the Tutorial view */
        self.ShadowTutorial1.hidden = true
        self.ShadowTutorial2.hidden = true
        self.ShadowTutorial3.hidden = true
        self.ShadowTutorial4.hidden = true
        self.ShadowTutorial5.hidden = true
        self.NextButton.hidden = true
        
        
        
        /* Conceal the GameOver view */
        self.ShadowGameOver.hidden = true
        self.character_losing.hidden = true
        self.GameOverButton.hidden = true
        self.PlayAgainButton.hidden = true
        
        /* Manually stack the start of the tower */
//        addTowerFootPrint(.Left)
        addTowerFootPrint(.Middle)
//        addTowerFootPrint(.Middle)
//        addTowerFootPrint(.Right)
        
        /* Randomize tower to just outside of the screen */
        addRandomFootPrint(10)
        
        /* Setup play button selection handler */
        if state == .Title {
            playButton.selectedHandler = {
                /* Start game */
                self.ShadowGameStart.hidden = true
                self.playButton.hidden = true
                self.TutorialButton.hidden = true
                self.state = .Playing
            }
            TutorialButton.selectedHandler = {
                /* Start Tutorial */
                self.ShadowTutorial1.hidden = false
                self.ShadowGameStart.hidden = true
                self.playButton.hidden = true
                self.TutorialButton.hidden = true
                self.NextButton.hidden = false
                self.ShadowTutorial2.hidden = false
                self.NextButton.selectedHandler = {
                    self.ShadowTutorial2.hidden = true
                    self.ShadowTutorial3.hidden = false
                    self.NextButton.selectedHandler = {
                        self.ShadowTutorial3.hidden = true
                        self.ShadowTutorial4.hidden = false
                        self.NextButton.selectedHandler = {
                            self.ShadowTutorial4.hidden = true
                            self.ShadowTutorial5.hidden = false
                            self.NextButton.selectedHandler = {
                                self.ShadowTutorial5.hidden = true
                                self.state = .Playing
                                self.NextButton.hidden = true
                                
                            }
                        }
                    }
                }
            }
        }
      
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            /* Get touch position in scene */
            let location = touch.locationInNode(self)
            let firstFootPrint = FootPrintTower.first as FootPrintFalling!
            
            if state == .Playing {
                
                /* Was touch on left/right/mid side of screen? */
                if location.x > size.width*2/3  {
                    character.side = .Right
                } else if location.x > size.width/3  {
                    character.side = .Middle
                } else {
                    character.side = .Left
                }
                
                /* check character & footprint side (death check) */
                if character.side != firstFootPrint.side {
                    state = .GameOver
                    self.character_losing.hidden = false
                    self.GameOverButton.hidden = false
                    self.ShadowGameOver.hidden = false
                    self.PlayAgainButton.hidden = false
                    PlayAgainButton.selectedHandler = {
                        self.gameOver()
                    }
                    /* No need to continue as player dead */
                    return
                }
                
                
                /* Remove from FootPrint Tower Array */
                FootPrintTower.removeFirst()
                firstFootPrint.removeFromParent()
                
                /* Add a random footprint on top of footprint tower */
                addRandomFootPrint(1)
                
                /* Drop all the footprint down one step */
                for node:FootPrintFalling in FootPrintTower  {
                    
                    node.runAction(SKAction.moveBy(CGVector(dx: 0, dy: -85), duration: 0.005))
                    

                }
                
               
            }
            
        }
        
        /* Game not ready to play */
        if state == .GameOver { return }
        
        
        if state == .Playing {
            /* Increment Score */
            score += 1
        }
        
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if state != .Playing { return }
        
        /* Decrease Health */
        time -= 0.001
        
        /* Has the player run out of health? */
        if time < 0 {
            state = .GameOver
            self.character_losing.hidden = false
            self.GameOverButton.hidden = false
            self.ShadowGameOver.hidden = false
            self.PlayAgainButton.hidden = false
            PlayAgainButton.selectedHandler = {
                self.gameOver()
            }
        }
    }
    
    
    func addTowerFootPrint(side: Side){
        /* Add the new Footprint to the scene */
        
        /* copy the original footprint */
        let newFootPrint = FootPrintBase.copy() as! FootPrintFalling
        newFootPrint.connectFootPrint()
        
        /* Access last footprint properties */
        let lastFootPrint = FootPrintTower.last
        
        /* add on top of last footprint, default on first piece */
        let lastposition = lastFootPrint?.position ?? FootPrintBase.position
        newFootPrint.position = lastposition + CGPoint(x:0 ,y: 85)

        /* set side */
        newFootPrint.side = side
        
        /* Add footprint to scene */
        addChild(newFootPrint)
        
        /* Add footprint to the footprint tower */
        FootPrintTower.append(newFootPrint)
        
    }
    
    func addRandomFootPrint(total: Int) {
        /* Add random footprint to the footprint tower */
        
        for _ in 1...total {
            
            /* need to access last footprint properties */
            let lastFootPrint = FootPrintTower.last as FootPrintFalling!
            
            /* Need to ensure we don't create impossible footprint structure */
            if lastFootPrint.side != .Middle {
                addTowerFootPrint(.Middle)
            } else {
                /* random generator */
                let randomNum = CGFloat.random(min: 0, max: 1.0)
                
                if randomNum < 0.475 {
                    addTowerFootPrint(.Left)
                } else if randomNum < 0.95 {
                    addTowerFootPrint(.Right)
                } else {
                    addTowerFootPrint(.Middle)
                }
            }
            
        }
    }

    func gameOver(){
        
        self.character_losing.hidden = true
        self.GameOverButton.hidden = true
        self.PlayAgainButton.hidden = true
        self.playButton.hidden = false
        self.ShadowGameStart.hidden = false
        /* Game Over! */
        state = .GameOver
        
        /* Grab reference to the SpriteKit view */
        let skView = self.view as SKView!
        
        /* Load Game scene */
        let scene = GameScene(fileNamed:"GameScene") as GameScene!
        
        /* Ensure correct aspect mode */
        scene.scaleMode = .AspectFill
        
        /* Restart GameScene */
        skView.presentScene(scene)
        
        
    }
    
    
}
