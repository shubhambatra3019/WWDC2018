//: A SpriteKit based Playground
import PlaygroundSupport
import SpriteKit
import GameplayKit

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:-100, width: 600, height: 600))
let scene = GameStartScene(size: CGSize(width: 600, height: 600))
    // Set the scale mode to scale to fit the window
   // scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
//}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
