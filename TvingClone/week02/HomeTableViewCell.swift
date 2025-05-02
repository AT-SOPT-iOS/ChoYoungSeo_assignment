//
//  HomeTableViewCell.swift
//  week02
//
//  Created by 조영서 on 5/1/25.
//

import UIKit
import SnapKit

final class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"

    private var topRankingList: [TopRankingModel] = []
    private var liveList: [LiveModel] = []
    private var movieList: [MovieModel] = []
    private var baseballList: [BaseballModel] = []
    private var programList: [ProgramModel] = []
    private var favoriteList: [FavoriteModel] = []

    // MARK: - Section Headers
    private let topRankingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 티빙 TOP 10"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    private let liveHeader = makeSectionHeader(title: "실시간 인기 LIVE")
    private let movieHeader = makeSectionHeader(title: "실시간 인기 영화")
    private let favoriteHeader = makeSectionHeader(title: "김가현PD의 인생작 TOP 5")

    // MARK: - Poster Image
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "main_poster")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - CollectionViews
    private let topRankingCollectionView = makeCollectionView(itemSize: CGSize(width: 160, height: 146), spacing: 13)
    private let liveCollectionView = makeCollectionView(itemSize: CGSize(width: 160, height: 140), spacing: 8)
    private let movieCollectionView = makeCollectionView(itemSize: CGSize(width: 98, height: 146), spacing: 8)
    private let baseballCollectionView = makeCollectionView(itemSize: CGSize(width: 80, height: 50), spacing: 0)
    private let programCollectionView = makeCollectionView(itemSize: CGSize(width: 90, height: 45), spacing: 8)
    private let favoriteCollectionView = makeCollectionView(itemSize: CGSize(width: 160, height: 90), spacing: 8)

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupCollectionViews()
        setupLayout()
        setData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupCollectionViews() {
        [topRankingCollectionView, liveCollectionView, movieCollectionView, baseballCollectionView, programCollectionView, favoriteCollectionView].forEach {
            $0.delegate = self
            $0.dataSource = self
        }

        topRankingCollectionView.register(TopRankingCollectionViewCell.self, forCellWithReuseIdentifier: TopRankingCollectionViewCell.identifier)
        liveCollectionView.register(LiveCollectionViewCell.self, forCellWithReuseIdentifier: LiveCollectionViewCell.identifier)
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        baseballCollectionView.register(BaseballCollectionViewCell.self, forCellWithReuseIdentifier: BaseballCollectionViewCell.identifier)
        programCollectionView.register(ProgramCollectionViewCell.self, forCellWithReuseIdentifier: ProgramCollectionViewCell.identifier)
        favoriteCollectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCollectionViewCell.identifier)
    }

    private func setupLayout() {
        [posterImageView,
         topRankingTitleLabel, topRankingCollectionView,
         liveHeader, liveCollectionView,
         movieHeader, movieCollectionView,
         baseballCollectionView, programCollectionView,
         favoriteHeader, favoriteCollectionView
        ].forEach { contentView.addSubview($0) }

        posterImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }

        topRankingTitleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(13)
        }
        topRankingCollectionView.snp.makeConstraints {
            $0.top.equalTo(topRankingTitleLabel.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(146)
        }

        liveHeader.snp.makeConstraints {
            $0.top.equalTo(topRankingCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(13)
        }
        liveCollectionView.snp.makeConstraints {
            $0.top.equalTo(liveHeader.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(140)
        }

        movieHeader.snp.makeConstraints {
            $0.top.equalTo(liveCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(13)
        }
        movieCollectionView.snp.makeConstraints {
            $0.top.equalTo(movieHeader.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(146)
        }

        baseballCollectionView.snp.makeConstraints {
            $0.top.equalTo(movieCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }

        programCollectionView.snp.makeConstraints {
            $0.top.equalTo(baseballCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(45)
        }

        favoriteHeader.snp.makeConstraints {
            $0.top.equalTo(programCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(13)
        }
        favoriteCollectionView.snp.makeConstraints {
            $0.top.equalTo(favoriteHeader.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(90)
            $0.bottom.equalToSuperview().inset(23)
        }
    }

    private func setData() {
        topRankingList = TopRankingModel.dummy()
        liveList = LiveModel.dummy()
        movieList = MovieModel.dummy()
        baseballList = BaseballModel.dummy()
        programList = ProgramModel.dummy()
        favoriteList = FavoriteModel.dummy()

        [topRankingCollectionView, liveCollectionView, movieCollectionView, baseballCollectionView, programCollectionView, favoriteCollectionView].forEach {
            $0.reloadData()
        }
    }

    private static func makeSectionHeader(title: String) -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Pretendard-Bold", size: 15)

        let moreLabel = UILabel()
        moreLabel.text = "더보기"
        moreLabel.textColor = .gray
        moreLabel.font = UIFont(name: "Pretendard-Medium", size: 12)

        let stack = UIStackView(arrangedSubviews: [titleLabel, moreLabel])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }

    private static func makeCollectionView(itemSize: CGSize, spacing: CGFloat) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = itemSize
        layout.minimumLineSpacing = spacing
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case topRankingCollectionView: return topRankingList.count
        case liveCollectionView: return liveList.count
        case movieCollectionView: return movieList.count
        case baseballCollectionView: return baseballList.count
        case programCollectionView: return programList.count
        case favoriteCollectionView: return favoriteList.count
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case topRankingCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRankingCollectionViewCell.identifier, for: indexPath) as! TopRankingCollectionViewCell
            cell.dataBind(topRankingList[indexPath.item], index: indexPath.item)
            return cell
        case liveCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCollectionViewCell.identifier, for: indexPath) as! LiveCollectionViewCell
            cell.dataBind(liveList[indexPath.item], index: indexPath.item)
            return cell
        case movieCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
            cell.dataBind(movieList[indexPath.item], index: indexPath.item)
            return cell
        case baseballCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseballCollectionViewCell.identifier, for: indexPath) as! BaseballCollectionViewCell
            cell.dataBind(baseballList[indexPath.item], index: indexPath.item)
            return cell
        case programCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCollectionViewCell.identifier, for: indexPath) as! ProgramCollectionViewCell
            cell.dataBind(programList[indexPath.item], index: indexPath.item)
            return cell
        case favoriteCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.identifier, for: indexPath) as! FavoriteCollectionViewCell
            cell.dataBind(favoriteList[indexPath.item], index: indexPath.item)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

#Preview {
    HomeTableViewCell()
}
