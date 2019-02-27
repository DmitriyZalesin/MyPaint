//
//  DrawingView.swift
//  MyPaint
//
//  Created by Dmitriy Zalesin on 4/18/18.
//  Copyright © 2018 TM All rights reserved.
//

import Foundation
import UIKit

class PointLine {
    var startPoint: CGPoint
    var endPoint: CGPoint
    var color: UIColor
    var Width: CGFloat
    
    init(startPoint: CGPoint, endPoint: CGPoint, color: UIColor!, Width: CGFloat) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.color = color
        self.Width = Width
    }
}
    
class DrawingView: UIView {

    var pointsPicture: [PointLine] = []
    var lastPoint: CGPoint!
    var drawColor = UIColor.yellow
    var brWidth: CGFloat = 15 * 1.127
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = (touches.first as AnyObject).location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newLastPoint = (touches.first as AnyObject).location(in: self)
        pointsPicture.append(PointLine(startPoint: lastPoint, endPoint: newLastPoint, color: drawColor, Width: brWidth))
        lastPoint = newLastPoint
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.beginPath()
        context.setLineWidth(brWidth)
        context.setLineCap(.round)
        for point in pointsPicture {
            context.setLineWidth(point.Width)
            context.setStrokeColor(point.color.cgColor)
            context.move(to: CGPoint(x: point.startPoint.x, y: point.startPoint.y))
            context.addLine(to: CGPoint(x: point.endPoint.x, y: point.endPoint.y))
            context.strokePath()
        }
    }

}
