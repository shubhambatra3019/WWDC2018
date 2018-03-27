//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var numberBall = SKSpriteNode()
    //var numberBall2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        let redBall = SKShapeNode(circleOfRadius: 40)
        redBall.fillColor = .red
        redBall.position = CGPoint(x: 200, y: 250)
        self.addChild(redBall)
        
        applyPhysicsBody(to: redBall)
        redBall.physicsBody?.applyImpulse(CGVector(dx: 40, dy: 40))
        let blueBall = SKShapeNode(circleOfRadius: 40)
        blueBall.fillColor = .red
        blueBall.position = CGPoint(x: 10, y: 450)
        self.addChild(blueBall)
        
        applyPhysicsBody(to: blueBall)
        blueBall.physicsBody?.applyImpulse(CGVector(dx: -60, dy: -60))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        blueBall.physicsBody?.categoryBitMask = 1
        blueBall.physicsBody?.collisionBitMask = 1
        blueBall.physicsBody?.contactTestBitMask = 1
        
        redBall.physicsBody?.categoryBitMask = 1
    }
    
    func applyPhysicsBody(to ball: SKShapeNode) {
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.friction = 0.0
        ball.physicsBody?.linearDamping = 0.0
        ball.physicsBody?.angularDamping = 0.0
        //ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == 1 {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            
            let bigBall = SKShapeNode(circleOfRadius: 80)
            bigBall.fillColor = .blue
            bigBall.position = contact.contactPoint
            self.addChild(bigBall)
            applyPhysicsBody(to: bigBall)
            bigBall.physicsBody?.applyImpulse(CGVector(dx: 60, dy: 60))
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            if(touchedNode.count >= 1) {
                touchedNode[0].run(SKAction.move(to: location, duration: 0))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 300, height: 600))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
