import UIKit

//  Credit : https://www.hackingwithswift.com

protocol Storyboardabel {
    static func instantiate() -> Self
}

extension Storyboardabel where Self: UIViewController {
    
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: className)
    }
}
