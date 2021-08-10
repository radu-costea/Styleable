//
//  File.swift
//  
//
//  Created by Radu.Costea on 02.08.2021.
//

import Foundation
import UIKit

/// UIScrollview that has the content view height equal to its bounds
public class VScrollView: UIScrollView {
    public init(_ buildContentView: () -> UIView) {
        super.init(frame: .zero)
        self.embed {
            buildContentView()
                .constrain(\.widthAnchor, equalTo: self.widthAnchor)
                .padding(relativeTo: .edges)
        }
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
