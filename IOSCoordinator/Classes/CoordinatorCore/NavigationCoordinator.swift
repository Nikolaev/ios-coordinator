import UIKit

open class NavigationCoordinator: Coordinator<UINavigationController> {
    
    public func push(_ viewController: UIViewController, animated: Bool = true) {
        container.pushViewController(viewController, animated: animated)
    }
    
    public func pop(animated: Bool = true) {
        container.popViewController(animated: animated)
    }
    
    public func pop(count: Int) {
        pop(count: count, animated: true)
    }
    
    public func pop(count: Int, animated: Bool) {
        var stack = container.viewControllers
        var popCount = count
        while !stack.isEmpty && popCount > 0 {
            stack.removeLast()
            popCount -= 1
        }
        container.setViewControllers(stack, animated: animated)
    }
    
    public func popToRoot(animated: Bool = true) {
        container.popToRootViewController(animated: animated)
    }
    
    public func set(_ viewControllers: [UIViewController],
             animated: Bool = true)
    {
        container.setViewControllers(viewControllers, animated: animated)
    }
    
    public func pop(to viewController: UIViewController,
             animated: Bool = true)
    {
        container.popToViewController(viewController, animated: animated)
    }
    
    public func present(_ viewController: UIViewController,
                 style: UIModalPresentationStyle? = nil,
                 animated: Bool = true,
                 completion: Completion? = nil)
    {
        if let style = style {
            viewController.modalPresentationStyle = style
        }
        container.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss(animated: Bool = true, completion: Completion? = nil) {
        guard container.presentedViewController != nil || container.presentingViewController != nil
        else {
            return
        }
        container.dismiss(animated: animated, completion: completion)
    }
    
    public func replaceLast(with viewController: UIViewController, animated: Bool = true) {
        replace(last: 1, with: [viewController])
    }
    
    public func replace(last count: Int,
                 with viewControllers: [UIViewController],
                 animated: Bool = true)
    {
        var stack = container.viewControllers
        stack.removeLast(count)
        stack += viewControllers
        set(stack, animated: animated)
    }
    
    public func replaceViewControllers(after: UIViewController,
                                with viewControllers: [UIViewController],
                                animated: Bool = true)
    {
        var stack = container.viewControllers
        guard !stack.isEmpty, let viewController = stack.first(where: { $0 == after }) else {
            return
        }
        var proceed = false
        while proceed {
            if let current = stack.last {
                if current == viewController {
                    proceed = false
                } else {
                    stack.removeLast()
                }
            }
            if stack.isEmpty { proceed = false }
        }
        stack += viewControllers
        set(stack, animated: animated)
    }
        
}
