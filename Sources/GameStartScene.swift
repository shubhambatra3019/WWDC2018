import Foundation
import SpriteKit

public class GameStartScene: SKScene {
    public var startButton: UIButton
    public var firstButton: UIButton
    public var secondButton: UIButton
    public var thirdButton: UIButton
    public var fourthButton: UIButton
    
    
    override public init(size: CGSize) {
        startButton = UIButton(frame: CGRect(x: size.width/2 - 175, y: size.height - 100, width: 350, height: 60))
        startButton.backgroundColor = .gray
        startButton.layer.cornerRadius = 10
        startButton.clipsToBounds = true
        startButton.isHidden = false
        startButton.isEnabled = false
        startButton.setTitle("Start Game", for: .normal)
        
        fourthButton = UIButton(frame: CGRect(x: size.width/2 - 75, y: size.height/2 - 60, width: 150, height: 50))
        fourthButton.backgroundColor = .blue
        fourthButton.layer.cornerRadius = 10
        fourthButton.clipsToBounds = true
        fourthButton.isHidden = false
        fourthButton.setTitle("32", for: .normal)
        
        firstButton = UIButton(frame: CGRect(x: size.width/2 - 75, y: size.height/2, width: 150, height: 50))
        firstButton.backgroundColor = .blue
        firstButton.layer.cornerRadius = 10
        firstButton.clipsToBounds = true
        firstButton.isHidden = false
        firstButton.setTitle("64", for: .normal)
        
        secondButton = UIButton(frame: CGRect(x: size.width/2 - 75, y: size.height/2 + 60, width: 150, height: 50))
        secondButton.backgroundColor = .blue
        secondButton.layer.cornerRadius = 10
        secondButton.clipsToBounds = true
        secondButton.isHidden = false
        secondButton.setTitle("128", for: .normal)
        
        thirdButton = UIButton(frame: CGRect(x: size.width/2 - 75, y: size.height/2 + 120, width: 150, height: 50))
        thirdButton.backgroundColor = .blue
        thirdButton.layer.cornerRadius = 10
        thirdButton.clipsToBounds = true
        thirdButton.isHidden = false
        thirdButton.setTitle("256", for: .normal)
        
        super.init(size: size)
        backgroundColor = SKColor.darkGray
        let heading = "How To Play:"
        let inst3 = "3) Tap and hold a ball to select it"
        let inst2 = "2) Start the game"
        let inst4 = "4) Collide it with same numbered ball to add them"
        let inst1 = "1) Set a goal before starting game"
        let inst5 = "5) Reach your goal to win the game"
        let inst6 = "6) You lose if there are total 8 balls on screen at any point"
        let heading2 = "Set your Goal"
        
        addLabel(text: heading, fontSize: 25.0, position: CGPoint(x: size.width/2, y: size.height - 50))
        addLabel(text: inst1, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 70))
        addLabel(text: inst2, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 90))
        addLabel(text: inst3, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 110))
        addLabel(text: inst4, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 130))
        addLabel(text: inst5, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 150))
        addLabel(text: inst6, fontSize: 15.0, position: CGPoint(x: size.width/2, y: size.height - 170))
        addLabel(text: heading2, fontSize: 30.0, position: CGPoint(x: size.width/2, y: 2*size.height/3 - 20))
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
    
    @objc public func  changeGoal(sender: UIButton) {
        switch sender {
        case fourthButton:
            fourthButton.isSelected = true
            firstButton.isSelected = false
            secondButton.isSelected = false
            thirdButton.isSelected = false
            fourthButton.backgroundColor = .green
            firstButton.backgroundColor = .blue
            secondButton.backgroundColor = .blue
            thirdButton.backgroundColor = .blue
            startButton.isEnabled = true
            startButton.backgroundColor = .green
        case firstButton:
            fourthButton.isSelected = false
            firstButton.isSelected = true
            secondButton.isSelected = false
            thirdButton.isSelected = false
            fourthButton.backgroundColor = .blue
            firstButton.backgroundColor = .green
            secondButton.backgroundColor = .blue
            thirdButton.backgroundColor = .blue
            startButton.isEnabled = true
            startButton.backgroundColor = .green
        case secondButton:
            fourthButton.isSelected = false
            firstButton.isSelected = false
            secondButton.isSelected = true
            thirdButton.isSelected = false
            fourthButton.backgroundColor = .blue
            firstButton.backgroundColor = .blue
            secondButton.backgroundColor = .green
            thirdButton.backgroundColor = .blue
            startButton.isEnabled = true
            startButton.backgroundColor = .green
        case thirdButton:
            fourthButton.isSelected = false
            firstButton.isSelected = false
            secondButton.isSelected = false
            thirdButton.isSelected = true
            fourthButton.backgroundColor = .blue
            firstButton.backgroundColor = .blue
            secondButton.backgroundColor = .blue
            thirdButton.backgroundColor = .green
            startButton.isEnabled = true
            startButton.backgroundColor = .green
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
        if(fourthButton.isSelected) {
            gameScene.winValue = 32
        }
        else if(firstButton.isSelected) {
            gameScene.winValue = 64
        }
        else if(secondButton.isSelected) {
            gameScene.winValue = 128
        }
        else if(thirdButton.isSelected) {
            gameScene.winValue = 256
        }
        self.view?.presentScene(gameScene, transition: reveal)
        startButton.isHidden = true
    }
}

