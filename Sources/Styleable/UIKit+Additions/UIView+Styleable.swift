//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation
import UIKit

extension UIView: Styleable { }

extension Styleable where Self: UIView {
    public func onTap(call action: Selector, on target: Any) -> Self {
        let tapgesture = UITapGestureRecognizer()
        tapgesture.addTarget(target, action: action)
        addGestureRecognizer(tapgesture)
        return self
    }
}

extension Styleable where Self: UIView {
    
    // MARK: - Constraints
    
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutXAxisAnchor>,
                                             equalTo anchor: @autoclosure @escaping () -> NSLayoutXAxisAnchor,
                                             spacing value: CGFloat = 0.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(equalTo: anchor(), constant: value), priority: priority, onNextRunLoop: true)
    }
    
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutXAxisAnchor>,
                                             lessThanOrEqualTo anchor: @autoclosure @escaping () -> NSLayoutXAxisAnchor,
                                             spacing value: CGFloat = 0.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(lessThanOrEqualTo: anchor(), constant: value), priority: priority, onNextRunLoop: true)
    }
    
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutXAxisAnchor>,
                                             greaterThanOrEqualTo anchor: @autoclosure @escaping () -> NSLayoutXAxisAnchor,
                                             spacing value: CGFloat = 0.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(greaterThanOrEqualTo: anchor(), constant: value), priority: priority, onNextRunLoop: true)
    }
    
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutYAxisAnchor>,
                                             equalTo anchor: @autoclosure @escaping () -> NSLayoutYAxisAnchor,
                                             spacing value: CGFloat = 0.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(equalTo: anchor(), constant: value), priority: priority, onNextRunLoop: true)
    }
    
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutYAxisAnchor>,
                                             lessThanOrEqualTo anchor: @autoclosure @escaping () -> NSLayoutYAxisAnchor,
                                             spacing value: CGFloat = 0.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(lessThanOrEqualTo: anchor(), constant: value), priority: priority, onNextRunLoop: true)
    }
    
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutYAxisAnchor>,
                                             greaterThanOrEqualTo anchor: @autoclosure @escaping () -> NSLayoutYAxisAnchor,
                                             spacing value: CGFloat = 0.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(greaterThanOrEqualTo: anchor(), constant: value), priority: priority, onNextRunLoop: true)
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The constraint is not created imediately. Instead it is created on the next run loop. This allows creating relations between anchors of elements that have not been initialized yet,
    /// or that are about to be initialized.
    /// The created constraint is: `self[keyPath: keyPath] = anchor * multiplier`
    ///
    /// - Parameters:
    ///   - keyPath: The dimension of this entity
    ///   - anchor: The anchor to create a relation to
    ///   - multiplier: The multiplier between the two anchors
    ///   - priority: The priority of the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             equalTo anchor: @autoclosure @escaping () -> NSLayoutDimension,
                                             times multiplier: CGFloat = 1.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(equalTo: anchor(), multiplier: multiplier), priority: priority, onNextRunLoop: true)
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The constraint is not created imediately. Instead it is created on the next run loop. This allows creating relations between anchors of elements that have not been initialized yet,
    /// or that are about to be initialized.
    /// The created constraint is: `self[keyPath: keyPath] >= anchor * multiplier`
    ///
    /// - Parameters:
    ///   - keyPath: The dimension of this entity
    ///   - anchor: The anchor to create a relation to
    ///   - multiplier: The multiplier between the two anchors
    ///   - priority: The priority of the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             greaterThanOrEqualTo anchor: @autoclosure @escaping () -> NSLayoutDimension,
                                             times multiplier: CGFloat = 1.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(greaterThanOrEqualTo: anchor(), multiplier: multiplier),
                                priority: priority,
                                onNextRunLoop: true)
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The constraint is not created imediately. Instead it is created on the next run loop. This allows creating relations between anchors of elements that have not been initialized yet,
    /// or that are about to be initialized.
    /// The created constraint is: `self[keyPath: keyPath] <= anchor * multiplier`
    ///
    /// - Parameters:
    ///   - keyPath: The dimension of this entity
    ///   - anchor: The anchor to create a relation to
    ///   - multiplier: The multiplier between the two anchors
    ///   - priority: The priority of the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             lessThanOrEqualTo anchor: @autoclosure @escaping () -> NSLayoutDimension,
                                             times multiplier: CGFloat = 1.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(lessThanOrEqualTo: anchor(), multiplier: multiplier),
                                priority: priority,
                                onNextRunLoop: true)
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The created constraint is: `self[keyPath: keyPath] = value
    ///
    /// - Parameters:
    ///   - keyPath: The keypath for the dimension of the created constraint
    ///   - value: The value of the constraint
    ///   - priority: The priority for the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             equalTo value: CGFloat,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(equalToConstant: value), priority: priority)
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The created constraint is: `self[keyPath: keyPath] <= value
    ///
    /// - Parameters:
    ///   - keyPath: The keypath for the dimension of the created constraint
    ///   - value: The value of the constraint
    ///   - priority: The priority for the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             lessThanOrEqualTo value: CGFloat,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(lessThanOrEqualToConstant: value), priority: priority)
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The created constraint is: `self[keyPath: keyPath] >= value
    ///
    /// - Parameters:
    ///   - keyPath: The keypath for the dimension of the created constraint
    ///   - value: The value of the constraint
    ///   - priority: The priority for the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             greaterThanOrEqualTo value: CGFloat,
                                             at priority: UILayoutPriority = .required) -> Self {
        self.activateConstraint(self[keyPath: keyPath].constraint(greaterThanOrEqualToConstant: value), priority: priority)
    }
    
    // MARK: - Private methods
    
    private func activateConstraint(_ constraintBuilder: @escaping @autoclosure () -> NSLayoutConstraint, priority: UILayoutPriority, onNextRunLoop: Bool = false) -> Self {
        let activateBlock = {
            var constraint = constraintBuilder()
            constraint.priority = priority
            constraint.isActive = true
        }
        
        if onNextRunLoop {
            DispatchQueue.main.async(execute: activateBlock)
        } else {
            activateBlock()
        }
        return self
    }
    
    // MARK: - Deprecations
    
    @available(*, deprecated, renamed: "constrain(_:_:value:at:)")
    @discardableResult public func fixed(_ keyPath: KeyPath<Self, NSLayoutDimension>, _ relation: NSLayoutConstraint.Relation = .equal, value: CGFloat, at priority: UILayoutPriority = .required) -> Self {
        fatalError("")
    }
    
    @available(*, deprecated, renamed: "constrain(_:_:to:multiplier:at:)")
    @discardableResult public func proportional(_ keyPath: KeyPath<Self, NSLayoutDimension>, _ relation: NSLayoutConstraint.Relation = .equal, to anchor: @autoclosure @escaping () -> NSLayoutDimension, multiplier: CGFloat = 1.0, at priority: UILayoutPriority = .required) -> Self {
        fatalError("")
    }
}
