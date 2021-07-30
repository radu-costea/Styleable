import Foundation

public protocol Styleable { }

extension Styleable {
    
    public func with<V>(_ keyPath: ReferenceWritableKeyPath<Self, V>, _ value: V) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
    
    public func assign(to value: inout Self) -> Self {
        value = self
        return self
    }
}
