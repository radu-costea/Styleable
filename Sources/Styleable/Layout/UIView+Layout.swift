//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

// MARK: - View containment

extension UIView {
        
    public func embed(@ArrayBuilder<Padding> _ paddingsBuilder: () -> [Padding]) {
        let paddings = paddingsBuilder()
        paddings.forEach(self.embed(padding:))
    }
    
    // MARK: - Private methods
    
    private func embed(padding: Padding) {
        let views = padding.views
        
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        guard let guide = padding.guide else {
            return
        }
        
        let layoutGuide = self.layoutGuide(from: guide)
        views.forEach { view in
            NSLayoutConstraint.activate {
                view.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: padding.insets.left)
                view.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -padding.insets.right)
                view.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: padding.insets.top)
                view.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -padding.insets.bottom)
            }
        }
    }
}
