//
//  ProgramCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

final class ProgramCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProgramCollectionViewCell"

    // MARK: - UI Components

    private let programImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [programImageView].forEach {
            contentView.addSubview($0)
        }
        
        programImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Data Binding
    
    func dataBind(_ itemData: ProgramModel, index: Int) {
        programImageView.image = itemData.itemImg
    }
}
