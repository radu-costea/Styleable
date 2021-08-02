//
//  File.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

open class StyleableControl: UIControl {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.embed(self.buildSubviews)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.embed(self.buildSubviews)
    }
    
    @ArrayBuilder<Padding> open func buildSubviews() -> [Padding] { }
}
