
class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("Children should impliment 'start'")
    }
    
    
}
