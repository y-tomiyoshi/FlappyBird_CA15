//
//  end.swift
//  FlappyBird
//
//  Created by Yuki Tomiyoshi on 2014/07/26.
//  Copyright (c) 2014年 Fullstack.io. All rights reserved.
//

import Foundation
import SpriteKit

class end: SKScene, SKPhysicsContactDelegate {
    var scoreLabelNode : SKLabelNode!
    var gameOverLabelNode : SKLabelNode!
    var backButtonNode : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor(red: 255.0/255.0, green: 120.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var score : Int? = appDelegate.scoreNum
        
        scoreLabelNode = SKLabelNode(fontNamed:"Gothic")
        scoreLabelNode.position = CGPointMake( CGRectGetMidX( self.frame ), self.frame.size.height / 8 * 4 )
        scoreLabelNode.zPosition = 100
        scoreLabelNode.fontSize = 70.0
        scoreLabelNode.verticalAlignmentMode = .Center
        if score {
            scoreLabelNode.text = "score : " + String(score!)
        } else {
            scoreLabelNode.text = String(0)
            score = 0
        }
        self.addChild(scoreLabelNode)
        
        gameOverLabelNode = SKLabelNode(fontNamed:"Gothic")
        gameOverLabelNode.position = CGPointMake( CGRectGetMidX( self.frame ), self.frame.size.height / 8 * 5 )
        gameOverLabelNode.zPosition = 100
        gameOverLabelNode.text = "Game Over"
        gameOverLabelNode.fontSize = 60.0
        gameOverLabelNode.verticalAlignmentMode = .Center
        self.addChild(gameOverLabelNode)

        
        let birdTexture1 = SKTexture(imageNamed: "start.png")

        backButtonNode = SKSpriteNode(texture : birdTexture1)
        backButtonNode.anchorPoint = CGPointMake(0.0, 0.0)
        backButtonNode.size = CGSizeMake(self.frame.size.width / 8,
            self.frame.size.width / 15)
        backButtonNode.position = CGPointMake((self.frame.size.width - backButtonNode.frame.size.width) / 2,
            (self.frame.size.height - backButtonNode.frame.size.height) / 5)
        backButtonNode.name = "back"
        self.addChild(backButtonNode)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if let name = node.name {
                if name == "back" {
                    //遷移
                    if let scene = start.unarchiveFromFileForStart("start") as? start {
                        let skView = self.view as SKView
                        skView.showsFPS = true
                        skView.showsNodeCount = true
                        
                        /* Sprite Kit applies additional optimizations to improve rendering performance */
                        skView.ignoresSiblingOrder = true
                        
                        /* Set the scale mode to scale to fit the window */
                        scene.scaleMode = .AspectFill

                        self.view.presentScene(scene)
                    }
                }
            }
        }
    }

}
