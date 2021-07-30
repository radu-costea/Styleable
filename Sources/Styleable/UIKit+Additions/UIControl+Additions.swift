//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

extension Styleable where Self: UIControl {
    public func on(_ event: UIControl.Event, call selector: Selector, on target: Any?) -> Self {
        self.addTarget(target, action: selector, for: event)
        return self
    }
    
    @available(iOS 14, *)
    public func on(_ event: UIControl.Event, action: @escaping () -> Void) -> Self {
        self.addAction(.init { _ in
            action()
        }, for: event)
        return self
    }
}
