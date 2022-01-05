//
//  ViewController.swift
//  RxCocoaDemo
//
//  Created by soyeon on 2022/01/05.
//

import UIKit

import SnapKit
import Then

import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var loginView = LoginView()
    
    let idInputText:BehaviorSubject<String> = BehaviorSubject(value: "")
    let pwInputText:BehaviorSubject<String> = BehaviorSubject(value: "")
    let idValid : BehaviorSubject<Bool> = BehaviorSubject(value: false) // default값 false
    let pwValid : BehaviorSubject<Bool> = BehaviorSubject(value: true)
    
    var disposeBag = DisposeBag()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginView)
        loginView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(400)
        }
        
        bindInput()
        bindOutput()
    }
    
    private func bindInput() {
        // input
        loginView.idTextField.rx.text.orEmpty.bind(to: idInputText).disposed(by: disposeBag)
        idInputText.map(checkEmailValid).bind(to: idValid).disposed(by: disposeBag)
    }
    
    private func bindOutput() {
        // output
        idValid.subscribe(onNext:{ b in
            if b {
                print("유효한 형식입니다.")
            }
        }).disposed(by: disposeBag)
        
        Observable.combineLatest(idValid, pwValid,resultSelector: { $0 && $1 })
            .subscribe(onNext:{ b in
                self.loginView.loginButton.isEnabled = b}).disposed(by: disposeBag)
    }
    
    private func checkEmailValid(_ email:String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
        
}

