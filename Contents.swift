//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    var numberBall = SKSpriteNode()
    //var numberBall2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        let redBall = SKShapeNode(circleOfRadius: 40)
        redBall.fillColor = .red
        redBall.position = CGPoint(x: 200, y: 250)
        self.addChild(redBall)
        
        applyPhysicsBody(to: redBall)
        redBall.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        redBall.physicsBody?.categoryBitMask = 1
        redBall.physicsBody?.collisionBitMask = 2
        
        let blueBall = SKShapeNode(circleOfRadius: 50)
        blueBall.fillColor = .blue
        blueBall.position = CGPoint(x: 10, y: 450)
        self.addChild(blueBall)
        blueBall.physicsBody?.categoryBitMask = 2
        blueBall.physicsBody?.collisionBitMask = 1
        
        applyPhysicsBody(to: blueBall)
        blueBall.physicsBody?.applyImpulse(CGVector(dx: -30, dy: -30))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
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
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
