//
//  BoxOfficeCollectionViewCell.swift
//  week02
//
//  Created by 조영서 on 5/8/25.
//

import UIKit
import SnapKit
import Then

class BoxOfficeCollectionViewCell: UICollectionViewCell {

    static let identifier = "BoxOfficeCollectionViewCell"

    // MARK: - UI Components

    private let rankingLabel = UILabel().then {
        $0.font = UIFont.italicSystemFont(ofSize: 48)
        $0.textColor = .white
        $0.textAlignment = .left
    }

    private let movieNameLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.lineBreakMode = .byWordWrapping
    }

    private let openDateLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
        $0.textColor = .gray
    }

    private let posterImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "default_poster")
    }

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    private func setupLayout() {
        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor.gray3.cgColor
        contentView.layer.borderWidth = 1.5

        [posterImageView, rankingLabel, movieNameLabel, openDateLabel].forEach {
            contentView.addSubview($0)
        }

        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(posterImageView.snp.height).multipliedBy(2.0 / 3.0)
        }

        movieNameLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.top)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalTo(posterImageView.snp.leading).offset(-8)
        }

        openDateLabel.snp.makeConstraints {
            $0.top.equalTo(movieNameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(movieNameLabel)
        }

        rankingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.bottom.equalTo(posterImageView.snp.bottom)
        }
    }



    // MARK: - Configuration

    func configure(with movie: BoxOfficeMovie) {
        rankingLabel.text = movie.rank
        movieNameLabel.text = movie.movieNm
        openDateLabel.text = "개봉일 | \(movie.openDt)"
    }
}


#Preview {
    BoxOfficeCollectionViewCell()
}
