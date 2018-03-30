//: A SpriteKit based Playground
import PlaygroundSupport
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // let redBallCategory: UInt32 = 0x1 << 0
    //let blueBallCategory: UInt32 = 0x1 << 1
    
    override func didMove(to view: SKView) {
        // let ballRadius: CGFloat = 20
        self.physicsWorld.contactDelegate = self
        //backgroundColor = .orange
        
        var timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.add2Ball(x:y:)), userInfo: nil, repeats: true)
        
        // add2Ball(x: randomYPos(), y: randomYPos())
        
        //add2Ball(x: randomYPos(), y: randomYPos())
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        print(self.frame.minX)
        print(self.frame.maxX)
        print(self.frame.minY)
        print(self.frame.maxY)
        
        //blueBall.physicsBody?.categoryBitMask = 1
        //blueBall.physicsBody?.collisionBitMask = 1
        //blueBall.physicsBody?.contactTestBitMask = 1
        
        
        //redBall.physicsBody?.collisionBitMask = 1
        //redBall.physicsBody?.contactTestBitMask = 1
    }
    
    func randomYPos() -> CGFloat {
        var randX = Int(arc4random_uniform(640))
        randX = randX - 320
        return CGFloat(randX)
    }
    
    /*func randomXPos() -> Int {
     var randY = Int((arc4random_uniform(640)) - 320)
     print(randY)
     return randY
     }*/
    
    @objc func add2Ball(x: CGFloat, y: CGFloat) {
        let redBall = SKShapeNode(circleOfRadius: 40)
        redBall.fillColor = .red
        redBall.position = CGPoint(x: randomYPos(), y: randomYPos())
        self.addChild(redBall)
        
        applyPhysicsBody(to: redBall, size: 40)
        redBall.physicsBody?.applyImpulse(CGVector(dx: 40, dy: 40))
        redBall.physicsBody?.categoryBitMask = 1
        redBall.physicsBody?.collisionBitMask = 1
        redBall.physicsBody?.contactTestBitMask = 1
    }
    
    func add4Ball(x: CGFloat, y: CGFloat) {
        let bigBall = SKShapeNode(circleOfRadius: 80)
        bigBall.fillColor = .blue
        bigBall.position = CGPoint(x: x, y: y)
        self.addChild(bigBall)
        
        applyPhysicsBody(to: bigBall, size: 80)
        bigBall.physicsBody?.applyImpulse(CGVector(dx: 60, dy: 60))
        bigBall.physicsBody?.categoryBitMask = 2
        bigBall.physicsBody?.collisionBitMask = 2
        bigBall.physicsBody?.contactTestBitMask = 2
    }
    
    func add8Ball(x: CGFloat, y: CGFloat) {
        let biggerBall = SKShapeNode(circleOfRadius: 120)
        biggerBall.fillColor = .green
        biggerBall.position = CGPoint(x: x, y: y)
        self.addChild(biggerBall)
        applyPhysicsBody(to: biggerBall, size: 120)
        biggerBall.physicsBody?.applyImpulse(CGVector(dx: -80, dy: -80))
        biggerBall.physicsBody?.categoryBitMask = 3
        biggerBall.physicsBody?.collisionBitMask = 3
        biggerBall.physicsBody?.contactTestBitMask = 3
        
    }
    
    func add16Ball(x: CGFloat, y: CGFloat) {
        let biggerBall = SKShapeNode(circleOfRadius: 150)
        biggerBall.fillColor = .white
        biggerBall.position = CGPoint(x: x, y: y)
        self.addChild(biggerBall)
        applyPhysicsBody(to: biggerBall, size: 150)
        biggerBall.physicsBody?.applyImpulse(CGVector(dx: -90, dy: -90))
        biggerBall.physicsBody?.categoryBitMask = 4
        biggerBall.physicsBody?.collisionBitMask = 4
        biggerBall.physicsBody?.contactTestBitMask = 4
        
    }
    
    func add32Ball(x: CGFloat, y: CGFloat) {
        let biggerBall = SKShapeNode(circleOfRadius: 180)
        biggerBall.fillColor = .orange
        biggerBall.position = CGPoint(x: x, y: y)
        self.addChild(biggerBall)
        applyPhysicsBody(to: biggerBall, size: 180)
        biggerBall.physicsBody?.applyImpulse(CGVector(dx: -100, dy: -100))
        biggerBall.physicsBody?.categoryBitMask = 5
        biggerBall.physicsBody?.collisionBitMask = 5
        biggerBall.physicsBody?.contactTestBitMask = 5
        
    }
    
    
    func applyPhysicsBody(to ball: SKShapeNode, size: CGFloat) {
        ball.physicsBody = SKPhysicsBody(circleOfRadius: size)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.restitution = 0.5
        ball.physicsBody?.friction = 0.0
        ball.physicsBody?.linearDamping = 0.0
        ball.physicsBody?.angularDamping = 0.0
        //ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask
        let collision2: UInt32 = contact.bodyB.categoryBitMask
        
        if collision == 1 && collision2 == 1 {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            print("Red Balls Collided")
            add4Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
        }
            
        else if collision == 2 && collision2 == 2 {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            print("Blue Balls collided")
            add8Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
        }
        else if collision == 3 && collision2 == 3 {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            print("Green Balls Collided")
            add16Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
        }
        else if collision == 4 && collision2 == 4{
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            add32Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
            print("White Balls Collided")
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*for touch in touches {
         let location = touch.location(in: self)
         let touchedNode = self.nodes(at: location)
         if(touchedNode.count >= 1) {
         touchedNode[0].run(SKAction.moveTo(x: location.x, duration: 0.2))
         }
         }*/
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            if(touchedNode.count >= 1) {
                touchedNode[touchedNode.count-1].run(SKAction.move(to: location, duration: 0))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 750, height: 1334))
let scene = GameStartScene(size: CGSize(width: 750, height: 1334))
    // Set the scale mode to scale to fit the window
   // scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
//}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
