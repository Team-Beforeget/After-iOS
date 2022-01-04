//
//  TriangleView.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/04.
//

import UIKit

class TriangleView: UIView {

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
        
        path.move(to: CGPoint(x: self.frame.width / 2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        
        path.close()
        
        UIColor.systemPink.set()
        path.fill()
    }
}
