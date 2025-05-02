//
//  TopRankingCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit
import SnapKit

final class TopRankingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopRankingCollectionViewCell"
    
    // MARK: - UI Components

    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 48)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    
    private func setLayout() {
        [rankingLabel, posterImageView].forEach {
            contentView.addSubview($0)
        }

        posterImageView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }

        rankingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(posterImageView.snp.bottom)
            $0.trailing.equalTo(posterImageView.snp.leading).offset(-4)
        }
    }

    // MARK: - Data Binding

    func dataBind(_ itemData: TopRankingModel, index: Int) {
        rankingLabel.text = "\(itemData.ranking)"
        posterImageView.image = itemData.itemImg
    }
}
