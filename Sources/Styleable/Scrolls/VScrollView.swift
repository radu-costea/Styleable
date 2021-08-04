//
//  File.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

/// UIScrollview that has the content view height equal to its bounds
open class VScrollView: UIScrollView {
    public convenience init(_ buildContentView: () -> UIView) {
        self.init()
        self.embed {
            buildContentView()
                .constrain(\.widthAnchor, to: self.widthAnchor)
                .padding(relativeTo: .edges)
        }
        
    }
}
