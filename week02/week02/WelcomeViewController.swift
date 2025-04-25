//
//  WelcomeViewController.swift
//  week02
//
//  Created by 조영서 on 4/23/25.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    var id: String?
    var nickname: String?

    private lazy var backTologinButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.backgroundColor = UIColor(named: "tvingred")
        button.layer.cornerRadius = 3
        return button
    }()
    
    @objc private func backTologinButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // 상단바 뒤로가기 버튼 비활성화
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        backTologinButton.addTarget(self, action: #selector(backTologinButtonTapped), for: .touchUpInside)
        
        // MARK: - UI 요소
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tving_logo")
        imageView.contentMode = .scaleAspectFit
        
        let userName = (nickname?.isEmpty == false) ? nickname! : (id ?? "")

        let titleLabel = UILabel()
        titleLabel.text = "\(userName)님\n반가워요!"
        titleLabel.textColor = .gray1
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "Pretendard-Bold", size: 23)
        
        // MARK: - addSubview
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(backTologinButton)
        
        // MARK: - 스냅킷 레이아웃
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.snp.width).multipliedBy(210.0 / 375.0) // 원본 비율 유지
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(67)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(75)
        }
        
        backTologinButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(290)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
    }
}

#Preview {
    WelcomeViewController()
}
