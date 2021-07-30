//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

@objc
open class ZStackView: UIView {
    open convenience init(@ArrayBuilder<Padding> _ paddingsBuilder: @escaping () -> [Padding]) {
        self.init()
        self.embed(paddingsBuilder)
    }
}
