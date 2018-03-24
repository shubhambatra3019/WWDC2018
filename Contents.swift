//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    var numberBall = SKSpriteNode()
    var numberBall2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        numberBall = self.childNode(withName: "numberBall") as! SKSpriteNode
        numberBall2 = self.childNode(withName: "numberBall2") as! SKSpriteNode
        numberBall2.physicsBody?.applyImpulse(CGVector(dx: -30, dy: -30))
        numberBall.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20 ))
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Hello")
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
