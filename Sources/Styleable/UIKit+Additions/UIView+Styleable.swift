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
    
    // MARK: - Constraints
    
    @discardableResult public func offset<T, C: NSLayoutAnchor<T>>(_ keyPath: KeyPath<Self, C>, _ relation: NSLayoutConstraint.Relation = .equal, to anchor: @autoclosure @escaping () -> C, value: CGFloat = 0.0, at priority: UILayoutPriority = .required) -> Self {
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
    
    @discardableResult public func proportional(_ keyPath: KeyPath<Self, NSLayoutDimension>, _ relation: NSLayoutConstraint.Relation = .equal, to anchor: @autoclosure @escaping () -> NSLayoutDimension, multiplier: CGFloat = 1.0, at priority: UILayoutPriority = .required) -> Self {
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
    
    @discardableResult public func fixed(_ keyPath: KeyPath<Self, NSLayoutDimension>, _ relation: NSLayoutConstraint.Relation = .equal, value: CGFloat, at priority: UILayoutPriority = .required) -> Self {
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
    
    public func centeredHorizontally(in guide: UIView.Guide) -> Padding {
        HStackView {
            UIView()
                .fixed(\.widthAnchor, value: 0)
            
            self
            
            UIView()
                .fixed(\.heightAnchor, value: 0)
        }
        .with(\.distribution, .equalSpacing)
        .with(\.alignment, .center)
        .padding(.zero, relativeTo: guide)
    }
    
    public func centered(in guide: UIView.Guide) -> Padding {
        HStackView {
            UIView().fixed(\.widthAnchor, value: 0)
            
            VStackView {
                UIView().fixed(\.heightAnchor, value: 0)
                
                self
                
                UIView().fixed(\.heightAnchor, value: 0)
            }
            .with(\.distribution, .equalSpacing)
            .with(\.alignment, .center)
            
            UIView().fixed(\.widthAnchor, value: 0)
        }
        .with(\.distribution, .equalSpacing)
        .with(\.alignment, .center)
        .padding(.zero, relativeTo: guide)
    }
}
