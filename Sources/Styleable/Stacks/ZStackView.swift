//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

/// A subclass of UIView specialized for laying out views one on top of the other.
/// The last view in the array being the most visible
@objc open class ZStackView: UIView {
    public convenience init(@ArrayBuilder<Padding> _ paddingsBuilder: @escaping () -> [Padding]) {
        self.init()
        self.embed(paddingsBuilder)
    }
}
