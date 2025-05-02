//
//  HomeViewController.swift
//  week02
//
//  Created by 조영서 on 5/1/25.

import UIKit
import SnapKit

final class HomeViewController: UIViewController {

    // MARK: - UI Components
    private let tableView = UITableView()
    private let menuTabView = TopTabMenuBar()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupTableView()
        setupLayout()
    }

    // MARK: - TableView Setup
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }

    // MARK: - Layout
    private func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        let headerView = makeHeaderView()
        tableView.tableHeaderView = headerView
        headerView.frame.size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)

        let footerView = makeFooterView()
        tableView.tableFooterView = footerView
        footerView.frame.size = footerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }

    private func makeHeaderView() -> UIView {
        let container = UIView()
        [logoImageView, searchButton, vLogoButton, menuTabView, mainPosterImageView].forEach {
            container.addSubview($0)
        }

        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalToSuperview()
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }

        vLogoButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().inset(11)
            $0.size.equalTo(30)
        }

        searchButton.snp.makeConstraints {
            $0.top.equalTo(vLogoButton)
            $0.trailing.equalTo(vLogoButton.snp.leading).offset(-11)
            $0.size.equalTo(30)
        }

        menuTabView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }

        mainPosterImageView.snp.makeConstraints {
            $0.top.equalTo(menuTabView.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview().offset(-20)
        }

        return container
    }

    private func makeFooterView() -> UIView {
        let container = UIView()
        [noticePwView, infoStackView1, infoStackView2].forEach {
            container.addSubview($0)
        }

        noticePwView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(347)
            $0.height.equalTo(50)
        }

        infoStackView1.snp.makeConstraints {
            $0.top.equalTo(noticePwView.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(16)
        }

        infoStackView2.snp.makeConstraints {
            $0.top.equalTo(infoStackView1.snp.bottom)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-70)
        }

        return container
    }

    // MARK: - Header UI Components
    private let logoImageView = makeImageView(named: "tving")
    private let searchButton = makeIconButton(named: "search")
    private let vLogoButton = makeIconButton(named: "tving_minilogo")

    private let mainPosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "main_poster")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Footer UI Components
    private let contactButton = makeFooterButton("고객문의")
    private let termsButton = makeFooterButton("이용약관")
    private let privacyPolicyButton = makeFooterButton("개인정보처리방침", isWhite: true)
    private let businessInfoButton = makeFooterButton("사업자정보")
    private let recruitButton = makeFooterButton("인재채용")

    private let noticePwView: UIView = {
        let container = UIView()
        container.backgroundColor = .gray4
        container.layer.cornerRadius = 5

        let label1 = UILabel()
        label1.text = "공지"
        label1.textColor = .gray
        label1.font = UIFont(name: "Pretendard-Medium", size: 11)

        let label2 = UILabel()
        label2.text = "티빙 계정 공유 정책 추가 안내"
        label2.textColor = .white
        label2.font = UIFont(name: "Pretendard-Medium", size: 11)

        let icon = UIImageView(image: UIImage(named: "btn_next")?.withRenderingMode(.alwaysTemplate))
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFit

        container.addSubview(label1)
        container.addSubview(label2)
        container.addSubview(icon)

        label1.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.bottom.equalToSuperview().inset(10)
        }
        label2.snp.makeConstraints {
            $0.leading.equalTo(label1.snp.trailing).offset(4)
            $0.centerY.equalTo(label1)
        }
        icon.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
        }

        return container
    }()

    private lazy var infoStackView1: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [contactButton, divider(), termsButton, divider(), privacyPolicyButton])
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }()

    private lazy var infoStackView2: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [businessInfoButton, divider(), recruitButton])
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }()

    // MARK: - Factory Methods
    private static func makeImageView(named: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: named)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    private static func makeIconButton(named: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: named), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }

    private static func makeFooterButton(_ title: String, isWhite: Bool = false) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(isWhite ? .white : .gray, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 11)
        return button
    }

    private func divider() -> UILabel {
        let label = UILabel()
        label.text = "·"
        label.textColor = .gray
        label.font = UIFont(name: "Pretendard-Medium", size: 11)
        return label
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

#Preview {
    HomeViewController()
}
