//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

extension Styleable where Self: UIControl {
    
    /// Adds a new action for the given event
    /// - Parameters:
    ///   - event: The event that triggers the action
    ///   - selector: The method handling the action
    ///   - target: The target to call the method on
    /// - Returns: self
    public func on(_ event: UIControl.Event, call selector: Selector, on target: Any?) -> Self {
        self.addTarget(target, action: selector, for: event)
        return self
    }
    
    /// Adds a new action for the given event
    ///
    /// Multiple calls to this method will override the previous added action
    /// 
    /// - Parameters:
    ///   - event: The event that triggers the action
    ///   - action: The handler for the action
    /// - Returns: self
    @available(iOS 14, *)
    public func on(_ event: UIControl.Event, action: @escaping () -> Void) -> Self {
        self.addAction(.init { _ in
            action()
        }, for: event)
        return self
    }
}
