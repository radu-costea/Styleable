//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

/// A subclass of UIStackView specialized for laying out views vertically
@objc open class VStackView: UIStackView {
    public override var axis: NSLayoutConstraint.Axis {
        set { super.axis = .vertical }
        get { .vertical }
    }
    
    public required init(distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, @ArrayBuilder<UIView> _ arrangedSubviewsBuilder: () -> [UIView] = { [] }) {
        super.init(frame: .zero)
        let views = arrangedSubviewsBuilder()
        views.forEach(self.addArrangedSubview(_:))
        self.axis = .vertical
        self.distribution = distribution
        self.spacing = spacing
        self.alignment = alignment
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        self.axis = .vertical
    }
}
