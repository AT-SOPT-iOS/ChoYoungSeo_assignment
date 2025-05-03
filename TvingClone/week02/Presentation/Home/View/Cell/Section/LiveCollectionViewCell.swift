//
//  LiveCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit
import SnapKit

final class LiveCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LiveCollectionViewCell"
    
    // MARK: - UI Components

    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 10)
        label.textColor = .white
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 10)
        label.textColor = .gray
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 10)
        label.textColor = .gray
        return label
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
        [thumbnailImageView, rankingLabel, titleLabel, subTitleLabel, ratingLabel].forEach {
            contentView.addSubview($0)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(90) 
        }

        rankingLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(4)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(23)
        }

        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(23)
        }

        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(23)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Data Binding
    
    func dataBind(_ itemData: LiveModel, index: Int) {
        thumbnailImageView.image = itemData.itemImg
        rankingLabel.text = "\(itemData.ranking)"
        titleLabel.text = itemData.title
        subTitleLabel.text = itemData.subTitle
        ratingLabel.text = itemData.rating
    }
}
