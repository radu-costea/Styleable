//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation

/// Encapsulates a customization that can be a applied to a any given target.
public struct Style<Target> {
    public typealias Customization = (Target) -> Void
    
    private var customization: (Target) -> Void
    
    // MARK: - Lifecycle
    
    public init(_ block: @escaping Customization) {
        self.customization = block
    }
    
    // MARK: - Public methods
    
    /// Applies the customization to the given target
    /// - Parameter target: The target to be customized
    public func apply(to target: Target) {
        self.customization(target)
    }
}

extension Styleable {
    /// Applies the given customizations to self
    ///
    /// If the styles override the same characteristics of the target, the more prioritary changes are at the end of the array of styles.
    ///
    /// - Parameter styles: The array of customizations to be applied. 
    /// - Returns: self
    public func style(_ styles: Style<Self>...) -> Self {
        styles.forEach { $0.apply(to: self) }
        return self
    }
}
