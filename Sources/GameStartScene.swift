import Foundation
import SpriteKit

public class GameStartScene: SKScene {
    public var startButton: UIButton
    public var firstButton: UIButton
    public var secondButton: UIButton
    public var thirdButton: UIButton
    public var fourthButton: UIButton
    
    override public init(size: CGSize) {
        startButton = UIButton(frame: CGRect(x: size.width/2 - 175, y: size.height - 80, width: 350, height: 60))
        startButton.backgroundColor = .green
        startButton.layer.cornerRadius = 10
        startButton.clipsToBounds = true
        startButton.setTitle("Start Game", for: .normal)
        
        firstButton = UIButton(frame: CGRect(x: size.width/2 - 125, y: size.height/2 + 25, width: 250, height: 50))
        firstButton.backgroundColor = .blue
        firstButton.layer.cornerRadius = 10
        firstButton.clipsToBounds = true
        firstButton.setTitle("256", for: .normal)
        
        secondButton = UIButton(frame: CGRect(x: size.width/2 - 125, y: size.height/2 + 75, width: 250, height: 50))
        secondButton.backgroundColor = .blue
        secondButton.layer.cornerRadius = 10
        secondButton.clipsToBounds = true
        secondButton.setTitle("512", for: .normal)
        
        thirdButton = UIButton(frame: CGRect(x: size.width/2 - 125, y: size.height/2 + 125, width: 250, height: 50))
        thirdButton.backgroundColor = .blue
        thirdButton.layer.cornerRadius = 10
        thirdButton.clipsToBounds = true
        thirdButton.setTitle("1024", for: .normal)
        
        fourthButton = UIButton(frame: CGRect(x: size.width/2 - 125, y: size.height/2 + 125, width: 250, height: 50))
        fourthButton.backgroundColor = .blue
        fourthButton.layer.cornerRadius = 10
        fourthButton.clipsToBounds = true
        fourthButton.setTitle("128", for: .normal)
        
        super.init(size: size)
        backgroundColor = SKColor.darkGray
        
        let heading = "How To Play:"
        let inst3 = "3) Tap and hold a ball to select it"
        let inst2 = "2) Start the game"
        let inst4 = "4) Collide it with same numbered ball to add them"
        let inst1 = "1) Set a goal before starting game"
        let inst5 = "5) Reach your goal to win the game"
        let heading2 = "Set your Goal"
        
        addLabel(text: heading, fontSize: 25.0, position: CGPoint(x: size.width/2, y: size.height - 100))
        addLabel(text: inst1, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 120))
        addLabel(text: inst2, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 140))
        addLabel(text: inst3, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 160))
        addLabel(text: inst4, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 180))
        addLabel(text: inst5, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 200))
        addLabel(text: heading2, fontSize: 30.0, position: CGPoint(x: size.width/2, y: 2*size.height/3 - 50))
    }
    
    public func addLabel(text: String, fontSize: CGFloat, position: CGPoint) {
        var label = SKLabelNode(fontNamed: "Helvetica")
        label.text = text
        label.fontSize = fontSize
        label.fontColor = SKColor.white
        label.position = position
        self.addChild(label)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func didMove(to view: SKView) {
        startButton.addTarget(self, action: #selector(GameStartScene.moveToNextScene), for: UIControlEvents.primaryActionTriggered)
        self.view?.addSubview(startButton)
        firstButton.addTarget(self, action: #selector(changeGoal), for: UIControlEvents.primaryActionTriggered)
        self.view?.addSubview(firstButton)
        secondButton.addTarget(self, action: #selector(changeGoal), for: UIControlEvents.primaryActionTriggered)
        self.view?.addSubview(secondButton)
        thirdButton.addTarget(self, action: #selector(changeGoal), for: UIControlEvents.primaryActionTriggered)
        self.view?.addSubview(thirdButton)
        fourthButton.addTarget(self, action: #selector(changeGoal), for: UIControlEvents.primaryActionTriggered)
        self.view?.addSubview(fourthButton)
    }
    
    @objc public func changeGoal(sender: UIButton) {
        switch sender {
        case fourthButton:
            print("Score set to 128")
        case firstButton:
            print("Score set to 256")
        case secondButton:
            print("Score set to 512")
        case thirdButton:
            print("Score set to 1024")
        default:
            print("Something wrong happened")
        }
    }
    
    @objc public func moveToNextScene(sender: UIButton) {
        firstButton.isHidden = true
        secondButton.isHidden = true
        thirdButton.isHidden = true
        fourthButton.isHidden = true
        let reveal = SKTransition.flipVertical(withDuration: 0.8)
        let gameScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: reveal)
        startButton.isHidden = true
    }
}
