import SpriteKit

protocol BaseScene {
    var sceneManager: SceneTransitionDelegate? { get set }
}


public enum SceneIdentifier {
    case initialScene, battleScene, pauseScene, endScene
}

protocol SceneTransitionDelegate {
    func transitionToScene(_ indentifier: SceneIdentifier)
}

public class SceneManager : SceneTransitionDelegate {
    
    //Attributes
    public var sceneView: SKView
    var scenes: [SceneIdentifier: SKScene] = [:]
    var currentScene: SKScene?
    
    //Constructor
    public init(view: SKView) {
        sceneView = view
        addFonts()
    }
    
    //Methods
    private func addFonts() {
        let fontURL = Bundle.main.url(forResource: "Pixel Tactical", withExtension: "otf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
    }
    
    public func transitionToScene(_ indentifier: SceneIdentifier) {
//currentScene?.isUserInteractionEnabled = true
        if let scene = scenes[indentifier] {
            self.currentScene = scene
        } else {
            let scene = createScene(indentifier)
            scenes[indentifier] = scene
            self.currentScene = scene
        }
        //currentScene?.isUserInteractionEnabled = false
        sceneView.presentScene(currentScene)
    }
    
    fileprivate func createScene(_ indentifier: SceneIdentifier) -> SKScene {
        let viewSize = sceneView.frame.size
        
        switch indentifier {
            
        case .initialScene:
            let initial = InitialScene(size: viewSize)
            initial.sceneManager = self
            return initial
            
        case .battleScene:
            let battleScene1 = BattleScene(size: viewSize)
            battleScene1.sceneManager = self
            return battleScene1
            
            
        case .pauseScene:
            let pauseScene = InitialScene(size: viewSize)
            pauseScene.sceneManager = self
            return pauseScene
            
        case .endScene:
            let endScene = InitialScene(size: viewSize)
            endScene.sceneManager = self
            return endScene
        }
    }
}
