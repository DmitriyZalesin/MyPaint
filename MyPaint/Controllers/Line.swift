//
//  Line.swift
//  MyPaint
//
//  Created by Dmitriy Zalesin on 4/18/18.
//  Copyright © 2018 TM All rights reserved.
//

import Foundation
import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    var Width: CGFloat
    
    init(start: CGPoint, end: CGPoint, color: UIColor!, Width: CGFloat) {
        self.start = start
        self.end = end
        self.color = color
        self.Width = Width
    }
}
