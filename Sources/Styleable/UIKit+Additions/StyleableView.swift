//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

open class StyleableView: UIView {
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
