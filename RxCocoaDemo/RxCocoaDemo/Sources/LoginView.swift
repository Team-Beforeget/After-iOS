//
//  LoginView.swift
//  RxCocoaDemo
//
//  Created by soyeon on 2022/01/05.
//

import UIKit

class LoginView: UIView {

    // MARK: - Life Cycle
    
    var idTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }
    
    var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        configUI()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func configUI() {
        self.backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        [idTextField, loginButton].forEach {
            self.addSubview($0)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(50)
        }
    }
}
