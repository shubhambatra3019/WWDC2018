import SpriteKit
import GameplayKit

public class GameScene: SKScene, SKPhysicsContactDelegate {
    
    public var timer2 = Timer()
    public var timer =  Timer()
    public var pauseButton: UIButton
    public var resumeButton: UIButton
    public var mainScreenButton: UIButton
    public var totalBalls: Int
    public var winValue = 0
    
    override public init(size: CGSize) {
        pauseButton = UIButton(frame: CGRect(x: 5, y: 5, width: 100, height: 60))
        pauseButton.backgroundColor = .clear
        pauseButton.clipsToBounds = true
        pauseButton.isHidden = false
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.layer.zPosition = 1
        
        resumeButton = UIButton(frame: CGRect(x: size.width/2 - 100, y: size.height/2 - 100, width: 200, height: 80))
        resumeButton.backgroundColor = .blue
        resumeButton.layer.cornerRadius = 10
        resumeButton.clipsToBounds = true
        resumeButton.isHidden = true
        resumeButton.setTitle("Resume Game", for: .normal)
        
        mainScreenButton = UIButton(frame: CGRect(x: size.width/2 - 120, y: size.height/2, width: 250, height: 80))
        mainScreenButton.backgroundColor = .blue
        mainScreenButton.layer.cornerRadius = 10
        mainScreenButton.clipsToBounds = true
        mainScreenButton.isHidden = true
        mainScreenButton.setTitle("Go Back To Main Screen", for: .normal)
        
        totalBalls = 0
        
        super.init(size: size)
        self.add2Ball(x: 0, y: 0)
        timer = Timer.scheduledTimer(timeInterval:3.5, target: self, selector: #selector(self.add2Ball(x:y:)), userInfo: nil, repeats: true)
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(moveStationaryBalls), userInfo: nil, repeats: true)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func didMove(to view: SKView) {
        resumeButton.addTarget(self, action: #selector(resumeButtonTapped), for: .primaryActionTriggered)
        self.view?.addSubview(resumeButton)
        mainScreenButton.addTarget(self, action: #selector(goToMainScreen), for: .primaryActionTriggered)
        self.view?.addSubview(mainScreenButton)
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .primaryActionTriggered)
        self.view?.addSubview(pauseButton)
        self.physicsWorld.contactDelegate = self
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 0.8
        border.angularDamping = 0.0
        border.linearDamping = 0.0
        self.physicsBody = border
        
    }
    
    @objc public func resumeButtonTapped() {
        timer = Timer.scheduledTimer(timeInterval:3.5, target: self, selector: #selector(self.add2Ball(x:y:)), userInfo: nil, repeats: true)
        self.view?.isPaused = false
        resumeButton.isHidden = true
        mainScreenButton.isHidden = true
    }
    
    @objc public func goToMainScreen() {
        resumeButton.isHidden = true
        pauseButton.isHidden = true
        mainScreenButton.isHidden = true
        self.view?.isPaused = false
        let reveal = SKTransition.flipVertical(withDuration: 1)
        let mainScene = GameStartScene(size: self.size)
        self.view?.presentScene(mainScene, transition: reveal)
    }
    
    public func randomYPos() -> CGFloat {
        var randX = Int(arc4random_uniform(200))
        return CGFloat(randX)
    }
    
    /*public func randomXPos() -> Int {
     var randY = Int((arc4random_uniform(640)) - 320)
     print(randY)
     return randY
     }*/
    
    @objc public func moveStationaryBalls() {
        for child in children {
            if(child.physicsBody?.velocity.dx == 0) {
                child.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: 0))
            }
            else if(child.physicsBody?.velocity.dy == 0) {
                child.physicsBody?.applyImpulse(CGVector(dx: 0, dy: randomSpeed()))
            }
            
        }
    }
    
    public func randomSpeed() -> CGFloat{
        var xSpeed = Int(arc4random_uniform(9)) + 8
        var randomSign = Int(arc4random_uniform(2))
        if(randomSign == 0) {
            return CGFloat(xSpeed)
        }
        else {
            return CGFloat(xSpeed * -1)
        }
    }
    
    public func checkGameOver() {
        if(totalBalls >= 8) {
            
            pauseButton.isHidden = true
            let gameOverScene = GameOverScene(size: self.size)
            gameOverScene.infoLabel.text = "You Lost"
            self.view?.presentScene(gameOverScene, transition: SKTransition.flipVertical(withDuration: 0.8))
        }
    }
    
    @objc public func add2Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 25)
        ball.fillColor = .red
        ball.position = CGPoint(x: randomYPos(), y: randomYPos())
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 25)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 1
        ball.physicsBody?.collisionBitMask = 1|2|3|4|5
        ball.physicsBody?.contactTestBitMask = 1|2|3|4|5
        totalBalls = totalBalls + 1
        checkGameOver()
        
    }
    
    public func add4Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 35)
        ball.fillColor = .blue
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 35)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.collisionBitMask = 2|1|3|4|5
        ball.physicsBody?.contactTestBitMask = 2|1|3|4|5
        
    }
    
    public func add8Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 45)
        ball.fillColor = .green
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 45)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 3
        ball.physicsBody?.collisionBitMask = 3|2|1|4|5
        ball.physicsBody?.contactTestBitMask = 3|2|1|4|5
    }
    
    public func add16Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 55)
        ball.fillColor = .white
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 55)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 4
        ball.physicsBody?.collisionBitMask = 4|1|2|3|5
        ball.physicsBody?.contactTestBitMask = 4|1|2|3|5
        
    }
    
    public func add32Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 65)
        ball.fillColor = .orange
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 65)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 5
        ball.physicsBody?.collisionBitMask = 5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 5|1|2|3|4
    }
    
    public func add64Ball(x: CGFloat, y: CGFloat) {
        let ball = SKShapeNode(circleOfRadius: 75)
        ball.fillColor = .cyan
        ball.position = CGPoint(x: x, y: y)
        self.addChild(ball)
        applyPhysicsBody(to: ball, size: 75)
        ball.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
        ball.physicsBody?.categoryBitMask = 6
        ball.physicsBody?.collisionBitMask = 6|5|1|2|3|4
        ball.physicsBody?.contactTestBitMask = 6|5|1|2|3|4
    }
    
    public func add128Ball(x: CGFloat, y: CGFloat) {
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
    
    public func add256Ball(x: CGFloat, y: CGFloat) {
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
    
    public func applyPhysicsBody(to ball: SKShapeNode, size: CGFloat) {
        ball.physicsBody = SKPhysicsBody(circleOfRadius: size)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.restitution = 0.5
        ball.physicsBody?.friction = 0.0
        ball.physicsBody?.linearDamping = 0.0
        ball.physicsBody?.angularDamping = 0.0
        ball.physicsBody?.mass = 0.0872664675116539
        
    }
    
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask
        let collision2: UInt32 = contact.bodyB.categoryBitMask
        
        if collision == collision2 {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            totalBalls = totalBalls - 1
            switch collision {
            case 1:
                add4Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
            case 2:
                add8Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
            case 3:
                add16Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
            case 4:
                add32Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
                if(winValue == 32) {
                    gameWon()
                }
            case 5:
                add64Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
                if(winValue == 64) {
                    gameWon()
                }
            case 6:
                add128Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
                if(winValue == 128) {
                    gameWon()
                }
            case 7:
                add256Ball(x: contact.contactPoint.x, y: contact.contactPoint.y)
                if(winValue == 256) {
                    gameWon()
                }
            default:
                print("Invalid collisionMask")
            }
        }
    }
    
    public func gameWon() {
        pauseButton.isHidden = true
        let gameOverScene = GameOverScene(size: self.size)
        gameOverScene.infoLabel.text = "You Won"
        self.view?.presentScene(gameOverScene, transition: SKTransition.flipVertical(withDuration: 0.8))
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(moveStationaryBalls), userInfo: nil, repeats: true)
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            for node in touchedNode {
                node.physicsBody?.applyImpulse(CGVector(dx: randomSpeed(), dy: randomSpeed()))
            }
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches Cancelled")
    }
    
    @objc public func pauseButtonTapped() {
        resumeButton.isHidden = false
        mainScreenButton.isHidden = false
        self.view?.isPaused = true
        timer.invalidate()
    }
    
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

