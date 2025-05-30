//
//  TopTabMenuBar.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

protocol TopTabMenuBarDelegate: AnyObject {
    func didSelectTab(at index: Int)
}

final class TopTabMenuBar: UIView {

    // MARK: - Properties
    private let menuItems = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    weak var delegate: TopTabMenuBarDelegate?

    private var selectedIndex: Int = 0
    private var indicatorLeadingConstraint: NSLayoutConstraint?

    // MARK: - UI Components

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(MenuTabCollectionViewCell.self, forCellWithReuseIdentifier: MenuTabCollectionViewCell.reuseIdentifier)
        return cv
    }()

    private let backgroundBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let indicatorBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupView()
        selectInitialTab()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        addSubview(collectionView)
        addSubview(backgroundBar)
        addSubview(indicatorBar)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])

        backgroundBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1) 
        }

        layoutIfNeeded()
        setIndicatorConstraint()
    }

    private func setIndicatorConstraint() {
        let tabWidth = UIScreen.main.bounds.width / CGFloat(menuItems.count)
        let initialCenterX = tabWidth * 0.5

        indicatorLeadingConstraint = indicatorBar.centerXAnchor.constraint(equalTo: leadingAnchor, constant: initialCenterX)

        NSLayoutConstraint.activate([
            indicatorBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorBar.heightAnchor.constraint(equalToConstant: 2),
            indicatorBar.widthAnchor.constraint(equalToConstant: 15),
            indicatorLeadingConstraint!
        ])
    }

    private func selectInitialTab() {
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        moveIndicator(to: 0)
    }

    private func moveIndicator(to index: Int) {
        let tabWidth = UIScreen.main.bounds.width / CGFloat(menuItems.count)
        let newCenterX = tabWidth * (CGFloat(index) + 0.5)
        indicatorLeadingConstraint?.constant = newCenterX

        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

// MARK: - UICollectionViewDataSource & Delegate

extension TopTabMenuBar: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuTabCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? MenuTabCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: menuItems[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        moveIndicator(to: selectedIndex)
        delegate?.didSelectTab(at: selectedIndex)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / CGFloat(menuItems.count)
        return CGSize(width: width, height: 40)
    }
}
