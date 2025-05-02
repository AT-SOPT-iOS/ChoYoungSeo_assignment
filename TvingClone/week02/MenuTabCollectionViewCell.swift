//
//  MenuTabCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

final class MenuTabCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "MenuTabCollectionViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textColor = .white
        return label
    }()

    override var isSelected: Bool {
        didSet {
            titleLabel.font = isSelected
                ? UIFont(name: "Pretendard-Bold", size: 16)
                : UIFont(name: "Pretendard-Regular", size: 16)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with text: String) {
        titleLabel.text = text
    }
}
