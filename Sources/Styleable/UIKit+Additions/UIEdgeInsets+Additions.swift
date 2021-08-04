//
//  UIEdgeInsets+Additions.swift
//  
//
//  Created by Radu.Costea on 03.08.2021.
//

import Foundation
import UIKit

extension UIEdgeInsets: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        let inset = CGFloat(value)
        self = .init(top: inset, left: inset, bottom: inset, right: inset)
    }
}

extension UIEdgeInsets: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        let inset = CGFloat(value)
        self = .init(top: inset, left: inset, bottom: inset, right: inset)
    }
}
