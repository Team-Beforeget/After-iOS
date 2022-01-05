//
//  NaviBarView.swift
//  Beforeget-Demo
//
//  Created by soyeon on 2022/01/05.
//

import UIKit

import SnapKit
import Then

protocol NaviBarViewDelegate {
    func touchUpBackButton()
    func touchUpDonwLoad()
}

final class NaviBarView: UIView {
    
    // MARK: - Properties
    
    private var backButton = UIButton().then {
        $0.setImage(UIImage(named: "btnBack"), for: .normal)
    }
    
    private var titleLabel = UILabel().then {
        $0.text = "report"
        $0.font = .systemFont(ofSize: 21, weight: .regular)
    }
    
    private var downLoadButton = UIButton().then {
        $0.setImage(UIImage(named: "btnDownload"), for: .normal)
    }
    
    var delegate: NaviBarViewDelegate?
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        configUI()
        setupLayout()
        setAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // deinit?
    
    // MARK: - Custom Methods
    
    private func configUI() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        [backButton, titleLabel, downLoadButton].forEach {
            self.addSubview($0)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(4)
            $0.width.height.equalTo(44)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButton.snp.centerY)
        }
        
        downLoadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(44)
            $0.centerY.equalTo(backButton.snp.centerY)
        }
    }
    
    private func setAction() {
        backButton.addAction(UIAction(handler: { _ in
            self.delegate?.touchUpBackButton()
        }), for: .touchUpInside)
        
        downLoadButton.addAction(UIAction(handler: { _ in
            self.delegate?.touchUpDonwLoad()
        }), for: .touchUpInside)
    }
}
