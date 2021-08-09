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
    
    @discardableResult public func constrain<T, C: NSLayoutAnchor<T>>(_ keyPath: KeyPath<Self, C>,
                                                                   _ relation: NSLayoutConstraint.Relation = .equal,
                                                                   to anchor: @autoclosure @escaping () -> C,
                                                                   spacing value: CGFloat = 0.0,
                                                                   at priority: UILayoutPriority = .required) -> Self {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let constraint: NSLayoutConstraint
            switch relation {
            case .equal:
                constraint = self[keyPath: keyPath].constraint(equalTo: anchor(), constant: value)
            case .lessThanOrEqual:
                constraint = self[keyPath: keyPath].constraint(lessThanOrEqualTo: anchor(), constant: value)
            case .greaterThanOrEqual:
                constraint = self[keyPath: keyPath].constraint(greaterThanOrEqualTo: anchor(), constant: value)
            @unknown default:
                fatalError("Unknown ")
            }
            
            constraint.priority = priority
            constraint.isActive = true
        }
        return self
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The constraint is not created imediately. Instead it is created on the next run loop. This allows creating relations between anchors of elements that have not been initialized yet,
    /// or that are about to be initialized.
    /// The created constraint is: `self[keyPath: keyPath] (<= | = | >=) anchor * multiplier`
    ///
    /// - Parameters:
    ///   - keyPath: The dimension of this entity
    ///   - relation: The relation between the anchor of this entity and the other anchor
    ///   - anchor: The anchor to create a relation to
    ///   - multiplier: The multiplier between the two anchors
    ///   - priority: The priority of the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             _ relation: NSLayoutConstraint.Relation = .equal,
                                             to anchor: @autoclosure @escaping () -> NSLayoutDimension,
                                             times multiplier: CGFloat = 1.0,
                                             at priority: UILayoutPriority = .required) -> Self {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let constraint: NSLayoutConstraint
            switch relation {
            case .equal:
                constraint = self[keyPath: keyPath].constraint(equalTo: anchor(), multiplier: multiplier)
            case .lessThanOrEqual:
                constraint = self[keyPath: keyPath].constraint(lessThanOrEqualTo: anchor(), multiplier: multiplier)
            case .greaterThanOrEqual:
                constraint = self[keyPath: keyPath].constraint(greaterThanOrEqualTo: anchor(), multiplier: multiplier)
            @unknown default:
                fatalError("Unknown ")
            }
            constraint.priority = priority
            constraint.isActive = true
        }
        return self
    }
    
    /// Creates and activates the constraint specified by the parameters
    ///
    /// The created constraint is: `self[keyPath: keyPath] (<= | = | >=) value
    ///
    /// - Parameters:
    ///   - keyPath: The keypath for the dimension of the created constraint
    ///   - relation: The relation between the dimension and value
    ///   - value: The value of the constraint
    ///   - priority: The priority for the created constraint
    /// - Returns: self
    @discardableResult public func constrain(_ keyPath: KeyPath<Self, NSLayoutDimension>,
                                             _ relation: NSLayoutConstraint.Relation = .equal,
                                             value: CGFloat,
                                             at priority: UILayoutPriority = .required) -> Self {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = self[keyPath: keyPath].constraint(equalToConstant: value)
        case .lessThanOrEqual:
            constraint = self[keyPath: keyPath].constraint(lessThanOrEqualToConstant: value)
        case .greaterThanOrEqual:
            constraint = self[keyPath: keyPath].constraint(greaterThanOrEqualToConstant: value)
        @unknown default:
            fatalError("Unknown ")
        }
        constraint.priority = priority
        constraint.isActive = true
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
