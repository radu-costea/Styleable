//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

@objc
open class VStackView: UIStackView {
    public override var axis: NSLayoutConstraint.Axis {
        set { super.axis = .vertical }
        get { .vertical }
    }
    
    public convenience init(@ArrayBuilder<UIView> _ arrangedSubviewsBuilder: () -> [UIView]) {
        self.init(arrangedSubviews: arrangedSubviewsBuilder())
        self.axis = .vertical
    }
}
