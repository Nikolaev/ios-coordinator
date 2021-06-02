import UIKit

public protocol CoordinatorProtocol {
    func isEqual(to other: CoordinatorProtocol) -> Bool
}

public class Coordinator<T: UIResponder>: Hashable, CoordinatorProtocol {
    
    weak private var container_: T?
    
    public var container: T {
        if let c = container_ {
            return c
        } else {
            fatalError("\(type(of: self)) has no container")
        }
    }
    
    private let hash = UUID.init().hashValue
    
    public init(container: T) {
        self.container_ = container
        container.addCoordinator(self)
    }
    
    public func start() {
        assertionFailure("Coordinator must override start method")
    }
    
    public static func == (lhs: Coordinator<T>, rhs: Coordinator<T>) -> Bool {
        lhs.hash == rhs.hash
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(hash)
    }
    
    public func isEqual(to other: CoordinatorProtocol) -> Bool {
        guard let other = other as? Coordinator<T> else {
            return false
        }
        
        return self == other
    }
    
}

public extension Coordinator {
    
    typealias Completion = () -> Void
    
}
