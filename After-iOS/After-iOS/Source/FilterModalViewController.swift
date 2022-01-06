//
//  FilterModalViewController.swift
//  After-iOS
//
//  Created by Thisisme Hi on 2022/01/06.
//

import UIKit

import SnapKit
import Then

class FilterModalViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private var dimmedView = UIView().then {
        $0.backgroundColor = .darkGray.withAlphaComponent(0.7)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
