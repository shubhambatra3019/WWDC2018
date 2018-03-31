//: A SpriteKit based Playground
import PlaygroundSupport
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var timer2 = Timer()
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        var timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.add2Ball(x:y:)), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(moveStationaryBalls), userInfo: nil, repeats: true)
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
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
    
    @objc func moveStationaryBalls() {
        for child in children {
            /*if(((child.physicsBody?.velocity.dx)! <= CGFloat(5.0) && (child.physicsBody?.velocity.dx)! >= CGFloat(-5.0)) && ((child.physicsBody?.velocity.dy)! <= CGFloat(5.0) && (child.physicsBody?.velocity.dy)! >= CGFloat(-5.0))) {
             child.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
             child.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/5, dy: randomSpeed()/5))
             print("Velocity changed")
             }
             */
            if(child.physicsBody?.velocity.dx == 0) {
                child.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/4, dy: 0))
            }
            if(child.physicsBody?.velocity.dy == 0) {
                child.physicsBody?.applyImpulse(CGVector(dx: 0, dy: randomSpeed()/4))
            }
        }
    }
    
    func randomSpeed() -> CGFloat{
        var xSpeed = Int(arc4random_uniform(41)) + 40
        var randomSign = Int(arc4random_uniform(2))
        if(randomSign == 0) {
            return CGFloat(xSpeed)
        }
        else {
            return CGFloat(xSpeed * -1)
        }
    }
    
    @objc func add2Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 25)
        ball.fillColor = .red
        ball.position = CGPoint(x: randomYPos(), y: randomYPos())
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 25)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/5, dy: randomSpeed()/5))
        ball.physicsBody?.categoryBitMask = 1
        ball.physicsBody?.collisionBitMask = 1|2|3|4|5
        ball.physicsBody?.contactTestBitMask = 1|2|3|4|5
    }
    
    func add4Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 35)
        ball.fillColor = .blue
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 35)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/4, dy: randomSpeed()/4))
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.collisionBitMask = 2|1|3|4|5
        ball.physicsBody?.contactTestBitMask = 2|1|3|4|5
    }
    
    func add8Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 45)
        ball.fillColor = .green
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 45)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/3, dy: randomSpeed()/3))
        ball.physicsBody?.categoryBitMask = 3
        ball.physicsBody?.collisionBitMask = 3|2|1|4|5
        ball.physicsBody?.contactTestBitMask = 3|2|1|4|5
        
    }
    
    func add16Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 55)
        ball.fillColor = .white
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 55)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/3, dy: randomSpeed()/3))
        ball.physicsBody?.categoryBitMask = 4
        ball.physicsBody?.collisionBitMask = 4|1|2|3|5
        ball.physicsBody?.contactTestBitMask = 4|1|2|3|5
        
    }
    
    func add32Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 65)
        ball.fillColor = .orange
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 65)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/2, dy: randomSpeed()/2))
        ball.physicsBody?.categoryBitMask = 5
        ball.physicsBody?.collisionBitMask = 5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 5|1|2|3|4
    }
    
    func add64Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 75)
        ball.fillColor = .cyan
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 75)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/2, dy: randomSpeed()/2))
        ball.physicsBody?.categoryBitMask = 6
        ball.physicsBody?.collisionBitMask = 6|5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 6|5|1|2|3|4
    }
    
    func add128Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 85)
        ball.fillColor = .magenta
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 85)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 7
        ball.physicsBody?.collisionBitMask = 7|6|5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 7|6|5|1|2|3|4
    }
    
    func add256Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 95)
        ball.fillColor = .orange
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 95)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 8
        ball.physicsBody?.collisionBitMask = 8|7|6|5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 8|7|6|5|1|2|3|4
    }
    
    func add512Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 105)
        ball.fillColor = .yellow
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 105)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()*1.4, dy: randomSpeed()*1.4))
        ball.physicsBody?.categoryBitMask = 9
        ball.physicsBody?.collisionBitMask = 9|8|7|6|5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 9|8|7|6|5|1|2|3|4
    }
    
    func add1024Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 115)
        ball.fillColor = .orange
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 115)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()*1.5, dy: randomSpeed()*1.5))
        ball.physicsBody?.categoryBitMask = 10
        ball.physicsBody?.collisionBitMask = 10|9|8|7|6|5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 10|9|8|7|6|5|1|2|3|4
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            if(touchedNode.count >= 1) {
                timer2.invalidate()
                touchedNode[touchedNode.count-1].physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                touchedNode[touchedNode.count-1].run(SKAction.move(to: location, duration: 0))
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            timer2 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(moveStationaryBalls), userInfo: nil, repeats: true)
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            for node in touchedNode {
                
                node.physicsBody?.applyImpulse(CGVector(dx: randomSpeed()/4, dy: randomSpeed()/4))
                print("Velocity addded")
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches Cancelled")
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:-100, width: 600, height: 600))
let scene = GameStartScene(size: CGSize(width: 600, height: 600))
    // Set the scale mode to scale to fit the window
   // scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
//}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
