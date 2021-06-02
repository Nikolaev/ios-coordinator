import UIKit

class WindowCoordinator: Coordinator<UIWindow> {
    
    public func setRoot(viewControler: UIViewController) {
        container.rootViewController = viewControler
    }
    
}
