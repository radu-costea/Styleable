//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    static func activate(@ArrayBuilder<NSLayoutConstraint> _ constraintBuilder: () -> [NSLayoutConstraint]) {
        self.activate(constraintBuilder())
    }
}
