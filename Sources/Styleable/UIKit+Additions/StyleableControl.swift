//
//  StyleableControl.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

open class StyleableControl: UIControl {
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
