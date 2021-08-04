//
//  File.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

/// UIScrollview that has the content view height equal to its bounds
open class HScrollView: UIScrollView {
    public convenience init(_ buildContentView: () -> UIView) {
        self.init()
        self.embed {
            buildContentView()
                .constrain(\.heightAnchor, to: self.heightAnchor, multiplier: 1.0)
                .padding(.zero, relativeTo: .edges)
        }
    }
}
