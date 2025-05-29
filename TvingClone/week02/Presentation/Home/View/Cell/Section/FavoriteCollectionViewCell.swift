//
//  FavoriteCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

final class FavoriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavoriteCollectionViewCell"
    
    
    private let favoriteCollectionView: UIImageView = {
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
        contentView.addSubview(favoriteCollectionView)

        
        favoriteCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}


extension FavoriteCollectionViewCell {
    func dataBind(_ itemData: FavoriteModel, index: Int) {
        favoriteCollectionView.image = itemData.itemImg
    }
}
