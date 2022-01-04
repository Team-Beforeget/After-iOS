//
//  ViewController.swift
//  Beforeget-Demo
//
//  Created by soyeon on 2022/01/05.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController, NaviBarViewDelegate {
    
    // MARK: - Properties
    
    private lazy var navigationBarView = NaviBarView().then {
        $0.delegate = self
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setupLayout()
    }
    
    // MARK: - Custom Methods
    
    private func configUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        [navigationBarView].forEach {
            view.addSubview($0)
        }
        
        navigationBarView.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(59)
        }
    }

    // MARK: - Protocols
    
    func touchUpBackButton() {
        print("뒤로가기 버튼")
    }
    
    func touchUpDonwLoad() {
        print("다운로드 버튼")
    }
}

