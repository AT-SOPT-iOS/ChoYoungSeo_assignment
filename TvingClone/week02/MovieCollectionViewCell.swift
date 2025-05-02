//
//  MovieCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/1/25.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
        
    private let movieImageView: UIImageView = {
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
        [movieImageView].forEach {
            contentView.addSubview($0)
        }
        
        movieImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension MovieCollectionViewCell {
    func dataBind(_ itemData: MovieModel, index: Int) {
        movieImageView.image = itemData.itemImg
    }
}
