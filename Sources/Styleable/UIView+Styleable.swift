//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation
import UIKit

extension UIView: Styleable { }

private protocol LayoutGuide {
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
    enum Guide {
        case safeArea
        case layoutMargins
        case edges
    }
    
    // MARK: - Private methods
    
    fileprivate func layoutGuide(from guide: Guide) -> LayoutGuide {
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

extension Styleable where Self: UIView {
    
    @discardableResult func offset<T>(_ keyPath: KeyPath<Self, NSLayoutAnchor<T>>, to anchor: @autoclosure @escaping () -> NSLayoutAnchor<T>, value: CGFloat = 0.0) -> Self {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self[keyPath: keyPath].constraint(equalTo: anchor(), constant: value).isActive = true
        }
        return self
    }
    
    @discardableResult func proportional(_ keyPath: KeyPath<Self, NSLayoutDimension>, to anchor: @autoclosure @escaping () -> NSLayoutDimension, multiplier: CGFloat = 1.0) -> Self {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self[keyPath: keyPath].constraint(equalTo: anchor(), multiplier: multiplier).isActive = true
        }
        return self
    }
}

public struct Padding {
    var insets: UIEdgeInsets = .zero
    var guide: UIView.Guide? = .edges
    @ArrayBuilder<UIView> var views: () -> [UIView]
}

class StyleableView: UIView {
    convenience init(@ArrayBuilder<Padding> _ paddingsBuilder: () -> [Padding]) {
        self.init()
        let paddings = paddingsBuilder()
        paddings.forEach { padding in
            let views = padding.views()
            views.forEach { view in
                view.translatesAutoresizingMaskIntoConstraints = false
                addSubview(view)
                
                if let guide = padding.guide {
                    let layoutGuide = self.layoutGuide(from: guide)
                    NSLayoutConstraint.activate {
                        view.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: padding.insets.left)
                        view.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -padding.insets.right)
                        view.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: padding.insets.top)
                        view.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -padding.insets.bottom)
                    }
                }
            }
        }
    }
    
    @discardableResult fileprivate func padding(_ insets: UIEdgeInsets, relativeTo guide: Guide = .edges) -> Self {
        guard let layoutGuide = self.superview?.layoutGuide(from: guide) else { return self }
        NSLayoutConstraint.activate {
            self.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.left)
            self.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -insets.right)
            self.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top)
            self.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom)
        }
        return self
    }
}

extension ArrayBuilder where T == Padding {
    public static func buildExpression(_ expression: UIView) -> ArrayBuilder<T>.Component {
        return [Padding(insets: .zero, guide: .edges) {
            expression
        }]
    }
}
