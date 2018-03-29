import Foundation
import SpriteKit

class GameStartScene: SKScene {
    
    var startButton: UIButton
    
    override init(size: CGSize) {
        startButton = UIButton(frame: CGRect(x: size.width/2-125, y: size.height/2-25, width: 250, height: 50))
        startButton.backgroundColor = .yellow
        startButton.layer.cornerRadius = 10
        startButton.clipsToBounds = true
        startButton.setTitle("Start", for: .normal)
        super.init(size: size)
        backgroundColor = SKColor.white
        let instructions1 = "Welcome to the Predator Prey Game!"
        let instructions2 = "Kill the predators by tapping on them"
        let instructions3 = "so that they don't eat the preys"
        let label1 = SKLabelNode(fontNamed: "Chalkduster")
        let label2 = SKLabelNode(fontNamed: "Chalkduster")
        let label3 = SKLabelNode(fontNamed: "Chalkduster")
        label1.text = instructions1
        label1.fontSize = 20
        label1.fontColor = SKColor.black
        label1.position = CGPoint(x: size.width/2, y: 2*size.height/3 + 40)
        self.addChild(label1)
        label2.text = instructions2
        label2.fontSize = 20
        label2.fontColor = SKColor.black
        label2.position = CGPoint(x: size.width/2, y: 2*size.height/3)
        self.addChild(label2)
        label3.text = instructions3
        label3.fontSize = 20
        label3.fontColor = SKColor.black
        label3.position = CGPoint(x: size.width/2, y: 2*size.height/3 - 40)
        self.addChild(label3)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        startButton.addTarget(self, action: #selector(GameStartScene.moveToNextScene), for: UIControlEvents.primaryActionTriggered)
        self.view?.addSubview(startButton)
    }
    
    @objc func moveToNextScene(sender: UIButton) {
        let reveal = SKTransition.flipHorizontal(withDuration: 1.0)
        let gameScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: reveal)
        startButton.isHidden = true
    }
}

