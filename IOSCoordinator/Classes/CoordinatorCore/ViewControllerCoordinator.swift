import UIKit

open class ViewControllerCoordinator: Coordinator<UIViewController> {
    
    public func addSubview(_ view: UIView) {
        container.view.addSubview(view)
    }
    
    public func present(_ viewController: UIViewController, style: UIModalPresentationStyle? = nil, animated: Bool = true, completion: Completion? = nil) {
        if let style = style {
            viewController.modalPresentationStyle = style
        }
        container.present(viewController, animated: animated, completion: completion)
    }
}
