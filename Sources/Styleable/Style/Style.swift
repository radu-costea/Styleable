//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation

/// Encapsulates a customization that can be a applied to a any given target.
public struct Modifier<Target, ModifiedTarget> {
    public typealias Customization = (Target) -> ModifiedTarget
    
    private var customization: Customization
    
    // MARK: - Lifecycle
    
    public init(_ block: @escaping Customization) {
        self.customization = block
    }
    
    // MARK: - Public methods
    
    /// Applies the customization to the given target
    /// - Parameter target: The target to be customized
    public func apply(to target: Target) -> ModifiedTarget {
        return self.customization(target)
    }
}

public typealias Style<Target> = Modifier<Target, Target>

extension Styleable {
    /// Applies the given customizations to self
    ///
    /// If the styles override the same characteristics of the target, the more prioritary changes are at the end of the array of styles.
    ///
    /// - Parameter styles: The array of customizations to be applied. 
    /// - Returns: self
    public func style(_ styles: Style<Self>...) -> Self {
        styles.reduce(self) { $1.apply(to: $0) }
    }
    
    public func modify<ModifiedContent>(_ modifier: Modifier<Self, ModifiedContent>) -> ModifiedContent {
        modifier.apply(to: self)
    }
    
    func modify<ModifiedContent1: Styleable, ModifiedContent2>(_ modifier1: Modifier<Self, ModifiedContent1>,
                                                               _ modifier2: Modifier<ModifiedContent1, ModifiedContent2>) -> ModifiedContent2 {
        self.modify(modifier1).modify(modifier2)
    }
    
    func modify<ModifiedContent1: Styleable, ModifiedContent2: Styleable, ModifiedContent3>(_ modifier1: Modifier<Self, ModifiedContent1>,
                                                                                           _ modifier2: Modifier<ModifiedContent1, ModifiedContent2>,
                                                                                           _ modifier3: Modifier<ModifiedContent2, ModifiedContent3>) -> ModifiedContent3 {
        self.modify(modifier1, modifier2).modify(modifier3)
    }
}
