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

    // MARK: - UI Components

    private lazy var moveToHomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.backgroundColor = UIColor(named: "tvingred")
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(moveToHomeButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayout()
    }

    // MARK: - Layout

    private func setupLayout() {
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

        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(moveToHomeButton)

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.snp.width).multipliedBy(210.0 / 375.0)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(67)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(75)
        }

        moveToHomeButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(290)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
    }

    // MARK: - Actions

    @objc private func moveToHomeButtonTapped() {
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

#Preview {
    WelcomeViewController()
}
