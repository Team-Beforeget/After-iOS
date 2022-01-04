//
//  CourseViewController.swift
//  Journey
//
//  Created by 초이 on 2021/06/29.
//

import UIKit

class CourseViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var courseTableView: UITableView!
    
    // MARK: - Properties

    var course: Course = Course(id: 0, title: "", courseDescription: "", totalDays: 0, situation: 0, property: 0, challenges: [
        Challenge(id: 0, situation: 0, title: "", challengeDescription: "", successDescription: "", year: "", month: "", day: "", currentStamp: 0, totalStamp: 0, userMents: []),
        Challenge(id: 0, situation: 0, title: "", challengeDescription: "", successDescription: "", year: "", month: "", day: "", currentStamp: 0, totalStamp: 0, userMents: []),
        Challenge(id: 0, situation: 0, title: "", challengeDescription: "", successDescription: "", year: "", month: "", day: "", currentStamp: 0, totalStamp: 0, userMents: []),
        Challenge(id: 0, situation: 0, title: "", challengeDescription: "", successDescription: "", year: "", month: "", day: "", currentStamp: 0, totalStamp: 0, userMents: []),
        Challenge(id: 0, situation: 0, title: "", challengeDescription: "", successDescription: "", year: "", month: "", day: "", currentStamp: 0, totalStamp: 0, userMents: []),
        Challenge(id: 0, situation: 0, title: "", challengeDescription: "", successDescription: "", year: "", month: "", day: "", currentStamp: 0, totalStamp: 0, userMents: []),
        Challenge(id: 0, situation: 0, title: "", challengeDescription: "", successDescription: "", year: "", month: "", day: "", currentStamp: 0, totalStamp: 0, userMents: [])
    ])
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXib()
        assignDelegation()
    }
    
    // MARK: - Functions
    
    private func registerXib() {
        courseTableView.register(UINib(nibName: Const.Xib.Name.firstDayTableViewCell, bundle: nil), forCellReuseIdentifier: Const.Xib.Identifier.firstDayTableViewCell)
        courseTableView.register(UINib(nibName: Const.Xib.Name.evenDayTableViewCell, bundle: nil), forCellReuseIdentifier: Const.Xib.Identifier.evenDayTableViewCell)
        courseTableView.register(UINib(nibName: Const.Xib.Name.oddDayTableViewCell, bundle: nil), forCellReuseIdentifier: Const.Xib.Identifier.oddDayTableViewCell)
    }
    
    private func assignDelegation() {
        courseTableView.delegate = self
        courseTableView.dataSource = self
    }
    
    func findCourseProgressDay(challenges: [Challenge]) -> Int {
        var day = 0
        for challenges in challenges {
            if challenges.situation == 0 {
                return day
            }
            day += 1
        }
        return day
    }
    
}

// MARK: - UITableViewDelegate

extension CourseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 123
        }
        return 160
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

// MARK: - UITableViewDataSource

extension CourseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = courseTableView.dequeueReusableCell(withIdentifier: Const.Xib.Identifier.firstDayTableViewCell) as? FirstDayTableViewCell {
                
                cell.setCell(challenge: course.challenges[indexPath.row])
                cell.setNextSituation(next: course.challenges[indexPath.row + 1].situation)
                
                return cell
            }
            return UITableViewCell()
        }
        if indexPath.row % 2 == 1 {
            if let cell = courseTableView.dequeueReusableCell(withIdentifier: Const.Xib.Identifier.evenDayTableViewCell) as? EvenDayTableViewCell {
                
                if indexPath.row < course.challenges.count-1 {
                    cell.setNextSituation(next: course.challenges[indexPath.row + 1].situation)
                }
                
                return cell
            }
            return UITableViewCell()
        } else {
            if let cell = courseTableView.dequeueReusableCell(withIdentifier: Const.Xib.Identifier.oddDayTableViewCell) as? OddDayTableViewCell {
                
                if indexPath.row < course.challenges.count-1 {
                    cell.setNextSituation(next: course.challenges[indexPath.row + 1].situation)
                }
                
                return cell
            }
            return UITableViewCell()
        }
    }
    
}
