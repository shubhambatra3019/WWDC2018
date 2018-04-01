import Foundation
import SpriteKit

public class GameOverScene: SKScene {
    
    public var mainScreenButton: UIButton
    public var infoLabel: UILabel
    
    override public init(size: CGSize) {
        
        mainScreenButton = UIButton(frame: CGRect(x: size.width/2 - 120, y: size.height/2, width: 250, height: 50))
        mainScreenButton.backgroundColor = .blue
        mainScreenButton.layer.cornerRadius = 10
        mainScreenButton.clipsToBounds = true
        mainScreenButton.isHidden = false
        mainScreenButton.setTitle("Go Back To Main Screen", for: .normal)
        
        infoLabel = UILabel(frame: CGRect(x: size.width/2 - 75, y: size.height/2 - 120, width: 350, height: 50))
        infoLabel.font = UIFont(name: "Helvetica", size: 35)
        infoLabel.textColor = .white
        infoLabel.isHidden = false
        super.init(size: size)
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func didMove(to view: SKView) {
        mainScreenButton.addTarget(self, action: #selector(goToMainScreen), for: .primaryActionTriggered)
        self.view?.addSubview(mainScreenButton)
        self.view?.addSubview(infoLabel)
    }
    
    @objc public func goToMainScreen() {
        mainScreenButton.isHidden = true
        infoLabel.isHidden = true
        let reveal = SKTransition.flipVertical(withDuration: 0.8)
        let mainScene = GameStartScene(size: self.size)
        self.view?.presentScene(mainScene, transition: reveal)
        
    }
    
}
