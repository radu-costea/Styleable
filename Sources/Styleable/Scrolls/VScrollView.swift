//
//  File.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

open class VScrollView: UIScrollView {
    public convenience init(_ buildContentView: () -> UIView) {
        self.init()
        self.embed {
            buildContentView()
                .constrain(\.widthAnchor, to: self.widthAnchor, multiplier: 1.0)
                .padding(.zero, relativeTo: .edges)
        }
        
    }
}
