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
        
        let heading = "How To Play:"
        let inst1 = "1) Tap and hold a ball and collide it with same numbered ball to make a bigger ball"
        let inst2 = "2) Reach your goal to win the game"
        addLabel(text: heading, fontSize: 25.0, position: CGPoint(x: size.width/2, y: 2*size.height/3 + 20))
        addLabel(text: inst1, fontSize: 10.0, position: CGPoint(x: size.width/2, y: 2*size.height/3))
        addLabel(text: inst2, fontSize: 10.0, position: CGPoint(x: size.width/2, y: 2*size.height/3 - 20))
    }
    
    func addLabel(text: String, fontSize: CGFloat, position: CGPoint) {
        let label = SKLabelNode(fontNamed: "Helvetica")
        label.text = text
        label.fontSize = fontSize
        label.fontColor = SKColor.black
        label.position = position
        self.addChild(label)
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

