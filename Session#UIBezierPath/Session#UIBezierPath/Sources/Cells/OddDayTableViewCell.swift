//
//  Xib.swift
//  Session#UIBezierPath
//
//  Created by soyeon on 2021/11/01.
//

import UIKit

class OddDayTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    let line = CAShapeLayer()
    
    
    let afterLine = CAShapeLayer()
    
    enum Size {
        static let radius: CGFloat = 80
        static let horizontalSpacing: CGFloat = 57
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let cellHeight: CGFloat = 160
        static let circleSize: CGFloat = 66
        static let strokeSize: CGFloat = 10
        
        static let verticalSpacingWithTopCell: CGFloat = 36
        static let verticalSpacingWithBottomCell: CGFloat = 36
    }
    
    private let circle1CenterPoint: CGPoint = CGPoint(x: Size.horizontalSpacing + Size.radius, y: -Size.verticalSpacingWithTopCell)
    private let circle1StartPoint: CGPoint = CGPoint(x: Size.horizontalSpacing, y: -Size.verticalSpacingWithTopCell)
    
    private let circle2StartPoint: CGPoint = CGPoint(x: Size.screenWidth - Size.radius - Size.horizontalSpacing, y: Size.cellHeight - Size.verticalSpacingWithTopCell - Size.radius)
    private let circle2CenterPoint: CGPoint = CGPoint(x: Size.screenWidth - Size.radius - Size.horizontalSpacing, y: Size.cellHeight - Size.verticalSpacingWithBottomCell)

    private let circle3CenterPoint: CGPoint = CGPoint(x: Size.screenWidth - Size.horizontalSpacing - Size.radius, y: Size.cellHeight - Size.verticalSpacingWithBottomCell)
    private let circle3StartPoint: CGPoint = CGPoint(x: Size.screenWidth - Size.horizontalSpacing, y: Size.cellHeight - Size.verticalSpacingWithBottomCell)
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var propertyBgView: UIView!
    
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initViewRounding()
        initPath()
//        initNextPath()
    }
    
    // MARK: - Functions
    
    private func initViewRounding() {
        propertyBgView.makeRounded(radius: propertyBgView.frame.height / 2)
    }
    
    private func initPath() {
        let path = UIBezierPath()
        path.move(to: circle1StartPoint)
        
        path.addArc(withCenter: circle1CenterPoint,
                    radius: Size.radius,
                    startAngle: -CGFloat.pi,
                    endAngle: CGFloat.pi / 2,
                    clockwise: false)

        path.addLine(to: circle2StartPoint)

        path.addArc(withCenter: circle2CenterPoint,
                    radius: Size.radius,
                    startAngle: -CGFloat.pi / 2,
                    endAngle: 0, clockwise: true)
        
        line.fillMode = .forwards
        line.fillColor = UIColor.clear.cgColor
        line.lineWidth = 20.0
        line.path = path.cgPath
        line.strokeColor = UIColor.white.cgColor
        
        self.contentView.layer.insertSublayer(line, at: 0)
    }
    
    private func initNextPath() {
        let path = UIBezierPath()
        path.move(to: circle3StartPoint)
        path.addArc(withCenter: circle3CenterPoint, radius: Size.radius, startAngle: 0, endAngle: CGFloat.pi / 2, clockwise: true)
        
        afterLine.fillMode = .forwards
        afterLine.fillColor = UIColor.clear.cgColor
        afterLine.lineWidth = 20.0
        afterLine.path = path.cgPath
        afterLine.strokeColor = UIColor.Green.cgColor
    }
    
    
    func setNextSituation(next: Int) {
        if next == 0 {
            afterLine.strokeColor = UIColor.white.cgColor
            self.contentView.layer.insertSublayer(afterLine, at: 0)
        } else if next == 2 || next == 1 {
            afterLine.strokeColor = UIColor.Green.cgColor
            self.contentView.layer.insertSublayer(afterLine, at: 0)
        }
    }
    
    private func setColorBySituation(situation: Int) {
        switch situation {
        case 0:
            line.strokeColor = UIColor.white.cgColor
            propertyBgView.backgroundColor = UIColor.Grey1Bg
        case 1:
            line.strokeColor = UIColor.Green.cgColor
            propertyBgView.backgroundColor = UIColor.Green
        case 2: 
            line.strokeColor = UIColor.Green.cgColor
            propertyBgView.backgroundColor = UIColor.Green
        default:
            break
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
