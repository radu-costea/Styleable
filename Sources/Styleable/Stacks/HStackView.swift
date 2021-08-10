//
//  HStackView.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

/// A subclass of UIStackView specialized for laying out views horizontally
@objc public class HStackView: UIStackView {
    @available(*, unavailable)
    public override var axis: NSLayoutConstraint.Axis {
        set { super.axis = .horizontal }
        get { .horizontal }
    }
    
    public init(distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, @ArrayBuilder<UIView> _ arrangedSubviewsBuilder: () -> [UIView] = { [] }) {
        super.init(frame: .zero)
        let views = arrangedSubviewsBuilder()
        views.forEach(self.addArrangedSubview(_:))
        super.axis = .horizontal
        self.distribution = distribution
        self.spacing = spacing
        self.alignment = alignment
    }
    
    @available(*, unavailable)
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        super.axis = .horizontal
    }
}
