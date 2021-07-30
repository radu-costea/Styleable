//
//  File.swift
//  
//
//  Created by Radu.Costea on 30.07.2021.
//

import Foundation
import UIKit

public class ZStackView: UIView {
    public convenience init(@ArrayBuilder<Padding> _ paddingsBuilder: @escaping () -> [Padding]) {
        self.init()
        self.embed(paddingsBuilder)
    }
}
