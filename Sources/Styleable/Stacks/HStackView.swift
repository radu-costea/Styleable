//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

@objc
open class HStackView: UIStackView {
    public override var axis: NSLayoutConstraint.Axis {
        set { super.axis = .horizontal }
        get { .horizontal }
    }
    
    public convenience init(@ArrayBuilder<UIView> _ arrangedSubviewsBuilder: () -> [UIView]) {
        self.init(arrangedSubviews: arrangedSubviewsBuilder())
        self.axis = .horizontal
    }
}
