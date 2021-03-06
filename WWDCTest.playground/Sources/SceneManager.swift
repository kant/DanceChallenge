import SpriteKit
import AVFoundation

public class SceneManager : SceneTransitionDelegate {
    
    //Attributes
    public var sceneView: SKView
   // var scenes: [SceneIdentifier: SKScene] = [:]
    
    //Constructor
    public init(view: SKView) {
        sceneView = view
        setUps()
    }
    
    //Methods
    private func setUps() {
        let fontURL = Bundle.main.url(forResource: "Nunito-Regular", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
    }
    
    public func transitionToScene(_ indentifier: SceneIdentifier) {
//        Flyweight
//
//        var currentScene: SKScene?
//
//        print(indentifier)
//        if let scene = scenes[indentifier] {
//            self.currentScene = scene
//        } else {
//            let scene = createScene(indentifier)
//            scenes[indentifier] = scene
//            self.currentScene = scene
//        }
//        sceneView.presentScene(currentScene)
        
        let scene = createScene(indentifier)
        sceneView.presentScene(scene)
    }
    
    fileprivate func createScene(_ indentifier: SceneIdentifier) -> SKScene {
        let viewSize = sceneView.frame.size
        
        switch indentifier {
            
        case .initialScene:
            let initial = CutScene(size: viewSize, level: 1)
            initial.sceneManager = self
            return initial
            
        case .battleScene1:
            let battleScene = BattleScene(size: viewSize, level: 1)
            battleScene.sceneManager = self
            return battleScene
            
        case .battleScene2:
            let battleScene = BattleScene(size: viewSize, level: 2)
            battleScene.sceneManager = self
            return battleScene
            
        case .battleScene3:
            let battleScene = BattleScene(size: viewSize, level: 3)
            battleScene.sceneManager = self
            return battleScene
         
        case .decisionScene1:
            let decisionScene = DecisionScene(size: viewSize, level: 1)
            decisionScene.sceneManager = self
            return decisionScene
            
        case .decisionScene2:
            let decisionScene = DecisionScene(size: viewSize, level: 2)
            decisionScene.sceneManager = self
            return decisionScene
            
        case .decisionScene3:
            let decisionScene = DecisionScene(size: viewSize, level: 3)
            decisionScene.sceneManager = self
            return decisionScene
            
        case .endScene:
            let endScene = CutScene(size: viewSize, level: 2)
            endScene.sceneManager = self
            return endScene
        }
    }
}
