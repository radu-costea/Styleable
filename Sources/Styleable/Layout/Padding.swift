//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

/// Describes how an array of views should be layed out in the containing view.
public struct Padding {
    public var insets: UIEdgeInsets
    public var guide: ZStackView.Guide?
    public var views: [UIView]
    
    public init(insets: UIEdgeInsets = .zero, relativeTo guide: ZStackView.Guide? = .edges, @ArrayBuilder<UIView> _ views: () -> [UIView]) {
        self.insets = insets
        self.guide = guide
        self.views = views()
    }
}

extension Styleable where Self: UIView {
    public func padding(_ insets: UIEdgeInsets, relativeTo guide: UIView.Guide) -> Padding {
        return Padding(insets: insets, relativeTo: guide) { self }
    }
}

extension ArrayBuilder where T == Padding {
    public static func buildExpression(_ expression: UIView) -> ArrayBuilder<T>.Component {
        return [Padding(insets: .zero, relativeTo: .edges) {
            expression
        }]
    }
}

extension ArrayBuilder where T: UIView {
    @available(*, unavailable, message: "Expected a UIView type instead of Padding")
    public static func buildExpression(_ expression: Padding) -> ArrayBuilder<T>.Component {
        fatalError("Expression unavailable")
    }
}
