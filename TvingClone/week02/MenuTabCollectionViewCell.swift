//
//  MenuTabCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit
import SnapKit 

final class MenuTabCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuTabCollectionViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String) {
        titleLabel.text = text
    }
}
