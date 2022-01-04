//
//  LinePathViewController.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/04.
//

import UIKit

class LinePathViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let customView = LinePathView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        customView.center = self.view.center

        view.addSubview(customView)
        
        
//        let triangleView = ThunderView(frame: self.view.frame)
//
//        view.addSubview(triangleView)
//
//        triangleView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            triangleView.widthAnchor.constraint(equalToConstant: 200),
//            triangleView.heightAnchor.constraint(equalToConstant: 200),
//            triangleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            triangleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
        
//        let view = ZeddView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        view.center = self.view.center
//        view.backgroundColor = .clear
//        self.view.addSubview(view)
    }
}

class ZeddView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let colors = [UIColor.orange, UIColor.black, UIColor.systemGreen, UIColor.systemPink, UIColor.cyan, UIColor.systemTeal]
        
        let values: [CGFloat] = [10, 20, 70]
        
        let total = values.reduce(0, +)
        
        var startAngle: CGFloat = (-(.pi) / 2)
        var endAngle: CGFloat = 0.0
        
        values.forEach { (value) in
            endAngle = (value / total) * (.pi * 2)
            
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center,
                        radius: 60,
                        startAngle: startAngle,
                        endAngle: startAngle + endAngle,
                        clockwise: true)
            
            colors.randomElement()?.set()
            path.fill()
            startAngle += endAngle
            path.close()
            
            UIColor.white.set()
            path.lineWidth = 3
            path.stroke()
        }
        
//        let semiCircle = UIBezierPath(arcCenter: center,
//                                      radius: 40,
//                                      startAngle: 0,
//                                      endAngle: (360 * .pi) / 180,
//                                      clockwise: true)
//        UIColor.white.set()
//        semiCircle.fill()
    }
}
