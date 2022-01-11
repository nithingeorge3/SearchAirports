
import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        
        let navigationBar = navigationController.navigationBar
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = UIColor.lightGray
        navigationBar.tintColor = .red
        navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name:
            "Avenir-Medium", size: 28.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.isTranslucent = true
        
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let searchCityCoordinator = SearchCityCoordinator(navigationController: navigationController)
        self.add(coordinator: searchCityCoordinator)
        searchCityCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
