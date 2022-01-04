//
//  LinePathView.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/04.
//

import UIKit

class LinePathView: UIView {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.lineWidth = 2
        path.lineJoinStyle = .round
        path.usesEvenOddFillRule = true
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 50, y: 100))
        
        path.close()
        
        UIColor.systemPink.set()
        path.stroke()
    }
    
}


