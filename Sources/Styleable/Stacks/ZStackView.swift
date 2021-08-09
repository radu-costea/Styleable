//
//  ZStackView.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

/// A subclass of UIView specialized for laying out views one on top of the other.
/// The last view in the array being the most visible
@objc public class ZStackView: UIView {
    public init(@ArrayBuilder<Padding> _ paddingsBuilder: @escaping () -> [Padding]) {
        super.init(frame: .zero)
        self.embed(paddingsBuilder)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
