//
//  BoxOfficeContentCell.swift
//  week02
//
//  Created by 조영서 on 5/10/25.
//

import UIKit
import SnapKit
import Then

final class BoxOfficeContentCell: UITableViewCell {
    static let identifier = "BoxOfficeContentCell"
    
    private let titleLabel = UILabel().then {
        $0.text = "주간 박스오피스"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
    }

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout()).then {
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .clear
        $0.register(BoxOfficeCollectionViewCell.self, forCellWithReuseIdentifier: BoxOfficeCollectionViewCell.identifier)
        $0.dataSource = self
        $0.isScrollEnabled = true
    }

    private var boxOfficeList: [BoxOfficeMovie] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupLayout()
        fetchData()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180 * 10 + 20)
            $0.bottom.equalToSuperview()
        }
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(180)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 12, leading: 16, bottom: 12, trailing: 16)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(180)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }

    private func fetchData() {
        Task {
            do {
                let result = try await BoxOfficeService.shared.fetchWeeklyBoxOffice(date: "20250501")
                self.boxOfficeList = result
                self.collectionView.reloadData()
            } catch {
                print("BoxOffice fetch error:", error)
            }
        }
    }
}


// MARK: - UICollectionViewDataSource

extension BoxOfficeContentCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boxOfficeList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxOfficeCollectionViewCell.identifier, for: indexPath) as? BoxOfficeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: boxOfficeList[indexPath.item])
        return cell
    }
}


#Preview {
    BoxOfficeContentCell()
}
