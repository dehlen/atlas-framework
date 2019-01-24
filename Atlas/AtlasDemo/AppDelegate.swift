import UIKit
import Atlas

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: MVVMCAppCoordinator!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let model = User()
        appCoordinator = MVVMCAppCoordinator(model: model, window: window!, factories: [BlueColorFactory(), GreenColorFactory()])
        appCoordinator.start()

        return true
    }
}
