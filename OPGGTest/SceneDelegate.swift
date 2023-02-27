import UIKit

public final class SceneDelegate: UIResponder {

    public var window: UIWindow?
}

@available(iOS 13.0, *)
extension SceneDelegate: UIWindowSceneDelegate {
    
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let viewModel = MainViewModel()
        
        let rootViewController = MainViewController(viewModel: viewModel)
        
        assert(scene is UIWindowScene)
        let windowScene = scene as! UIWindowScene
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
