//
//  BaseballCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

final class BaseballCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BaseballCollectionViewCell"

    // MARK: - UI Components

    private let baseballCollectionView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
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
        [baseballCollectionView].forEach {
            contentView.addSubview($0)
        }
        
        baseballCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Data Binding
    
    func dataBind(_ itemData: BaseballModel, index: Int) {
        baseballCollectionView.image = itemData.itemImg
    }
}
