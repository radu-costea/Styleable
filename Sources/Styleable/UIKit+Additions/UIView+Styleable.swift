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
    
    @discardableResult public func offset<T, C: NSLayoutAnchor<T>>(_ keyPath: KeyPath<Self, C>, to anchor: @autoclosure @escaping () -> C, value: CGFloat = 0.0) -> Self {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self[keyPath: keyPath].constraint(equalTo: anchor(), constant: value).isActive = true
        }
        return self
    }
    
    @discardableResult public func proportional(_ keyPath: KeyPath<Self, NSLayoutDimension>, to anchor: @autoclosure @escaping () -> NSLayoutDimension, multiplier: CGFloat = 1.0) -> Self {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self[keyPath: keyPath].constraint(equalTo: anchor(), multiplier: multiplier).isActive = true
        }
        return self
    }
}
