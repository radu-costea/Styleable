//
//  File.swift
//  
//
//  Created by Radu.Costea on 29.07.2021.
//

import Foundation
import UIKit

@objc
class HStackView: UIStackView {
    override var axis: NSLayoutConstraint.Axis {
        set { super.axis = .horizontal }
        get { .horizontal }
    }
}

@objc
class VStackView: UIStackView {
    override var axis: NSLayoutConstraint.Axis {
        set { super.axis = .vertical }
        get { .vertical }
    }
}

extension UIStackView {
    convenience init(@ArrayBuilder<UIView> _ arrangedSubviewsBuilder: () -> [UIView]) {
        self.init(arrangedSubviews: arrangedSubviewsBuilder())
    }
}
