//
//  CustomTabBar.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit

@IBDesignable
class CustomTabBar: UITabBar {

    private var shapeLayer: CALayer?

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPathCircle()
        shapeLayer.fillColor = ExpenseTracker.Colors.teal_0F202A.cgColor
        shapeLayer.opacity = 0.9

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    override func draw(_ rect: CGRect) {
        self.addShape()
//        self.roundCorners([.topLeft, .topRight], radius: 20)
    }
    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let buttonRadius: CGFloat = 35
//        return abs(self.center.x - point.x) > buttonRadius || abs(point.y) > buttonRadius
//    }

    func createPathCircle() -> CGPath {

        let radius: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - radius * 2), y: 0))
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 0), radius: radius, startAngle: CGFloat(180).degreesToRadians, endAngle: CGFloat(0).degreesToRadians, clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
