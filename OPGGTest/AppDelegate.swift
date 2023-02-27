import UIKit

public final class AppDelegate: UIResponder {
    
    public var window: UIWindow?
}

@main
extension AppDelegate: UIApplicationDelegate {
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if #available(iOS 13.0, *) {
            logger.info("Managed in SceneDelegate instead of AppDelegate")
        } else {
            let viewModel = MainViewModel()
            
            let rootViewController = MainViewController(viewModel: viewModel)
            
            let window = UIWindow(frame: UIScreen.main.bounds)
            self.window = window
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
        }
        
        return true
    }
    
    @available(iOS 13.0, *)
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
