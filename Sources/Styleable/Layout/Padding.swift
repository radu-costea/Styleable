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
    public func padding(_ insets: UIEdgeInsets = .zero, relativeTo guide: UIView.Guide) -> Padding {
        self.modify(.padding(insets, relativeTo: guide))
    }
    
    public func centeredHorizontally() -> UIView {
        self.modify(.centeredHorizontally())
    }
    
    public func centeredVertically() -> UIView {
        self.modify(.centeredVertically())
    }
    
    public func centered() -> UIView {
        self.modify(.centered())
    }
}

extension Modifier where Target: UIView, ModifiedTarget == Padding {
    static func padding(_ insets: UIEdgeInsets = .zero, relativeTo guide: UIView.Guide) -> Modifier<Target, Padding> {
        Modifier { view in
            Padding(insets: insets, relativeTo: guide) { view }
        }
    }
}

extension Modifier where Target: UIView, ModifiedTarget == UIView {
    static func centered() -> Modifier<Target, UIView> {
        Modifier { view in
            view.modify(.centeredVertically(), .centeredHorizontally())
        }
    }
    
    static func centeredHorizontally() -> Modifier<Target, UIView> {
        Modifier { view in
            HStackView(distribution: .equalSpacing) {
                UIView().constrain(\.widthAnchor, equalTo: 0)
                view
                UIView().constrain(\.widthAnchor, equalTo: 0)
            }
        }
    }
    
    static func centeredVertically() -> Modifier<Target, UIView> {
        Modifier { view in
            VStackView(distribution: .equalSpacing) {
                UIView().constrain(\.heightAnchor, equalTo: 0)
                view
                UIView().constrain(\.heightAnchor, equalTo: 0)
            }
        }
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
