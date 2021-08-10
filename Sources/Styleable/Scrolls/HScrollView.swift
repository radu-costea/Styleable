//
//  File.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

/// UIScrollview that has the content view height equal to its bounds
public class HScrollView: UIScrollView {
    public init(_ buildContentView: () -> UIView) {
        super.init(frame: .zero)
        self.embed {
            buildContentView()
                .constrain(\.heightAnchor, equalTo: self.heightAnchor)
                .padding(.zero, relativeTo: .edges)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
