//
//  ThunderView.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/01.
//

import UIKit

class ThunderView: UIView {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.white
    }
    
    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0,
//                                               width: self.frame.width,
//                                               height: self.frame.height / 2))
        
        
//        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0,
//                                                    width: 100, height: 100),
//                                cornerRadius: 10)
//
//        UIColor.systemPink.set()
//        path.fill()
//
//        UIColor.black.set()
//        path.stroke()
        
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addQuadCurve(to: CGPoint(x: 30, y: 0),
                      controlPoint: CGPoint(x: 10, y: 40))
        
        UIColor.systemPink.set()
        path.stroke()
        
    }
    
    
}
