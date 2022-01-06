//
//  ViewController.swift
//  After-iOS
//
//  Created by Thisisme Hi on 2022/01/05.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    private var filterButton = UIButton(type: .system).then {
        $0.setTitle("필터", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.addTarget(self, action: #selector(touchUpFilterButton(_:)), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        let loadData = MockParser.load(type: BaseResponseType<PostModel>.self, fileName: "post")
        guard let data = loadData else { return print("JSON파싱실패") }
        print(data)
    }

    private func configure() {
        view.addSubview(filterButton)
        
        filterButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }

    @objc func touchUpFilterButton(_ sender: UIButton) {
        print("하프모달 나와라 얍")
    }
}
