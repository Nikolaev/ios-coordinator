import Foundation
import UIKit

public protocol CoordinatorRootController {
    func addCoordinator(_ coordinator: CoordinatorProtocol)
    func removeCoordinator(_ coordinator: CoordinatorProtocol?)
}

extension UIResponder: CoordinatorRootController {
    
    public func addCoordinator(_ coordinator: CoordinatorProtocol) {
        var list = storedCoordinators
        list.append(coordinator)
        associatedCoordinators = list
    }
    
    public func removeCoordinator(_ coordinator: CoordinatorProtocol?) {
        guard let coordinator = coordinator else { return }
        var list = storedCoordinators
        list.removeAll(where: { $0.isEqual(to: coordinator) })
        associatedCoordinators = list
    }
    
}

private extension UIResponder {
    
    var storedCoordinators: [CoordinatorProtocol] {
        if let list = associatedCoordinators {
            return list
        }
        let list: [CoordinatorProtocol] = []
        associatedCoordinators = list
        return list
    }
    
    static var coordinatorsAssociationName: String = "kUIResponderCoordinatorsAssociationName"
    var associatedCoordinators: [CoordinatorProtocol]? {
        get {
            return (associationObject(for: &UIResponder.coordinatorsAssociationName)) as? [CoordinatorProtocol]
        }
        set {
            setAssociation(
                object: newValue,
                for: &UIResponder.coordinatorsAssociationName
            )
        }
    }
    
    private func setAssociation(object: Any?, for key: UnsafeRawPointer) {
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    private func associationObject(for key: UnsafeRawPointer) -> Any? {
        return objc_getAssociatedObject(self, key)
    }

}
