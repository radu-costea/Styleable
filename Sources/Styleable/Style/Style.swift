//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation

public struct Style<Target> {
    public typealias Customization = (Target) -> Void
    
    private var customization: (Target) -> Void
    
    // MARK: - Lifecycle
    
    public init(_ block: @escaping Customization) {
        self.customization = block
    }
    
    // MARK: - Public methods
    
    public func apply(to target: Target) {
        self.customization(target)
    }
}

extension Styleable {
    public func style(_ styles: Style<Self>...) -> Self {
        styles.forEach { $0.apply(to: self) }
        return self
    }
}
