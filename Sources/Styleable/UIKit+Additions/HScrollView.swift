//
//  File.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

class HScrollView: UIScrollView {
    convenience init(_ buildContentView: () -> UIView) {
        self.init()
        self.embed {
            buildContentView()
                .proportional(\.heightAnchor, to: self.heightAnchor, multiplier: 1.0)
                .padding(.zero, relativeTo: .edges)
        }
    }
}
