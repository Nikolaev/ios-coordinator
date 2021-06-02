import UIKit

open class TabBarCoordinator: Coordinator<UITabBarController> {
    
    public func set(_ viewControllers: [UIViewController], animated: Bool = false) {
        self.container.setViewControllers(viewControllers, animated: animated)
    }
    
    public func select(index: Int) {
        self.container.selectedIndex = index
    }
    
}
