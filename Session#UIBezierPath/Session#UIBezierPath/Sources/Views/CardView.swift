//
//  CardView.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/01.
//

import UIKit

class CardView: UIView {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    // MARK: - Custom View
    
    override func draw(_ rect: CGRect) {
        
        let cardRadius = CGFloat(30)
        let buttonSlotRadius = CGFloat(30)
        
        let viewSize = self.bounds.size
        let effectiveViewHeight = viewSize.height - buttonSlotRadius
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: cardRadius, y: 0))
        
        path.addLine(to: CGPoint(x: viewSize.width - cardRadius, y: 0))
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width - cardRadius,
                y: cardRadius
            ),
            radius: cardRadius,
            startAngle: CGFloat(Double.pi * 3 / 2),
            endAngle: CGFloat(0),
            clockwise: true
        )
        
        path.addLine(
            to: CGPoint(x: viewSize.width, y: effectiveViewHeight)
        )
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width - cardRadius,
                y: effectiveViewHeight - cardRadius
            ),
            radius: cardRadius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi / 2),
            clockwise: true
        )
        path.addLine(
            to: CGPoint(x: viewSize.width / 4 * 3, y: effectiveViewHeight)
        )
        
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width / 4 * 3 - buttonSlotRadius,
                y: effectiveViewHeight
            ),
            radius: buttonSlotRadius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi / 2),
            clockwise: true
        )
        path.addLine(
            to: CGPoint(
                x: viewSize.width / 4 + buttonSlotRadius,
                y: effectiveViewHeight + buttonSlotRadius
            )
        )
        path.addArc(
            withCenter: CGPoint(
                x: viewSize.width / 4 + buttonSlotRadius,
                y: effectiveViewHeight
            ),
            radius: buttonSlotRadius,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(Double.pi),
            clockwise: true
        )
        
        path.addLine(
            to: CGPoint(x: cardRadius, y: effectiveViewHeight)
        )
        path.addArc(
            withCenter: CGPoint(
                x: cardRadius,
                y: effectiveViewHeight - cardRadius
            ),
            radius: cardRadius,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(Double.pi),
            clockwise: true
        )
        
        path.addLine(to: CGPoint(x: 0, y: cardRadius))
        path.addArc(
            withCenter: CGPoint(x: cardRadius, y: cardRadius),
            radius: cardRadius,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi / 2 * 3),
            clockwise: true
        )
        
        
        path.close()
        
        UIColor.systemGray5.set()
        path.fill()
        
        
    }
    
}
