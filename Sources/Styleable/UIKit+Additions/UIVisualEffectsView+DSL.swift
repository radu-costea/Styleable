//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

extension UIVisualEffectView {
    convenience public init(effect: UIVisualEffect?, @ArrayBuilder<Padding> _ paddingsBuilder: () -> [Padding]) {
        self.init(effect: effect)
        self.contentView.embed(paddingsBuilder)
    }
}
