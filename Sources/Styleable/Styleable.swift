import Foundation

protocol Styleable { }

extension Styleable {
    func style(_ styles: Style<Self>...) -> Self {
        styles.forEach { $0.apply(to: self) }
        return self
    }
    
    func with<V>(_ keyPath: ReferenceWritableKeyPath<Self, V>, _ value: V) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}
