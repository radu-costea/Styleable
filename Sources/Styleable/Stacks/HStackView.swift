//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit


/// A subclass of UIStackView specialized for laying out views horizontally
@objc open class HStackView: UIStackView {
    public override var axis: NSLayoutConstraint.Axis {
        set { super.axis = .horizontal }
        get { .horizontal }
    }
    
    public convenience init(distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, @ArrayBuilder<UIView> _ arrangedSubviewsBuilder: () -> [UIView]) {
        self.init(arrangedSubviews: arrangedSubviewsBuilder())
        self.axis = .horizontal
        self.distribution = distribution
        self.spacing = spacing
        self.alignment = alignment
    }
}
