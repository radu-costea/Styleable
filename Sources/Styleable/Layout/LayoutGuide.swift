//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

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
    public enum Guide {
        case safeArea
        case layoutMargins
        case edges
    }
    
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
