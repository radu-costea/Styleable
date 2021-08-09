//
//  StyleableView.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

/// View that can be subclassed
open class StyleableView: UIView {
    public init() {
        super.init(frame: .zero)
        self.embed(self.buildSubviews)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.embed(self.buildSubviews)
    }
    
    @ArrayBuilder<Padding> open func buildSubviews() -> [Padding] { }
}
