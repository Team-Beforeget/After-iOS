//
//  Xib.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/01.
//

import UIKit

class EvenDayTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    let beforeLine = CAShapeLayer()
    let afterLine = CAShapeLayer()
    
    enum Size {
        static let radius: CGFloat = 80
        static let horizontalSpacing: CGFloat = 57
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let cellHeight: CGFloat = 160
        static let circleSize: CGFloat = 66
        static let strokeSize: CGFloat = 10
        // 위 셀과 공유하는 radius 크기
        static let verticalSpacingWithTopCell: CGFloat = 36
        static let verticalSpacingWithBottomCell: CGFloat = 33
    }
    
    let circle1CenterPoint: CGPoint = CGPoint(x: Size.screenWidth - Size.horizontalSpacing - Size.radius, y: -Size.verticalSpacingWithTopCell )
    let circle1StartPoint: CGPoint = CGPoint(x: Size.screenWidth - Size.horizontalSpacing - Size.radius, y: -Size.verticalSpacingWithTopCell )
    
    let circle2CenterPoint: CGPoint = CGPoint(x: Size.horizontalSpacing + Size.radius, y: Size.radius - Size.verticalSpacingWithTopCell + Size.radius)
    let circle2StartPoint: CGPoint = CGPoint(x: Size.horizontalSpacing + Size.radius, y: Size.radius - Size.verticalSpacingWithTopCell)

    let circle3CenterPoint: CGPoint = CGPoint(x: Size.horizontalSpacing + Size.radius, y: Size.cellHeight - Size.verticalSpacingWithTopCell)
    let circle3StartPoint: CGPoint = CGPoint(x: Size.horizontalSpacing, y: Size.cellHeight - Size.verticalSpacingWithBottomCell)
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var cellBgView: UIView!
    @IBOutlet weak var propertyBgView: UIView!
    @IBOutlet weak var propertyImageView: UIView!
    
    // MARK: - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        initViewRounding()
        initEvenPath()
        initNextPath()
    }
    
    // MARK: - Functions
    
    private func initViewRounding() {
        propertyBgView.makeRounded(radius: propertyBgView.frame.height / 2)
    }
    
    private func initEvenPath() {
        let path = UIBezierPath()
        path.move(to: circle1StartPoint)
        path.addArc(withCenter: circle1CenterPoint, radius: Size.radius, startAngle: 0, endAngle: CGFloat.pi / 2, clockwise: true)
        
        path.addLine(to: circle2StartPoint)

        path.addArc(withCenter: circle2CenterPoint, radius: Size.radius, startAngle: -CGFloat.pi / 2, endAngle: -CGFloat.pi, clockwise: false)
        
        beforeLine.fillMode = .forwards
        beforeLine.fillColor = UIColor.clear.cgColor
        beforeLine.lineWidth = 20.0
        beforeLine.path = path.cgPath
        beforeLine.strokeColor = UIColor.white.cgColor
        
        cellBgView.layer.insertSublayer(beforeLine, at: 0)
    }
    
    private func initNextPath() {
        let path = UIBezierPath()
        path.move(to: circle3StartPoint)
        path.addArc(withCenter: circle3CenterPoint, radius: Size.radius, startAngle: -CGFloat.pi, endAngle: CGFloat.pi / 2, clockwise: false)
        
        afterLine.fillMode = .forwards
        afterLine.fillColor = UIColor.clear.cgColor
        afterLine.lineWidth = 20.0
        afterLine.path = path.cgPath
        afterLine.strokeColor = UIColor.Green.cgColor
    }
    
    func setNextSituation(next: Int) {
        if next == 0 {
            afterLine.strokeColor = UIColor.white.cgColor
            cellBgView.layer.insertSublayer(afterLine, at: 0)
        } else if next == 2 {
            afterLine.strokeColor = UIColor.Green.cgColor
            cellBgView.layer.insertSublayer(afterLine, at: 0)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
