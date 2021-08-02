//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

/// An entity that has layout anchors
public protocol LayoutGuide {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutGuide { }
extension UILayoutGuide: LayoutGuide { }

extension UIView {
    /// Defines the guides specific to a view
    public enum Guide {
        case safeArea
        case layoutMargins
        case edges
    }
    
    /// Returns the ``LayoutGuide`` from the guide type
    /// - Parameter guide: The type of the Guide
    /// - Returns: The LayoutGuide that can be used for constructing layouts
    public func layoutGuide(from guide: Guide) -> LayoutGuide {
        switch guide {
        case .safeArea:
            return self.safeAreaLayoutGuide
        case .layoutMargins:
            return self.layoutMarginsGuide
        case .edges:
            return self
        }
    }
}
