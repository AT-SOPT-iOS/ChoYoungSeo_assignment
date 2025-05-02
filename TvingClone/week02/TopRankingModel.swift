//
//  TopRankingModel.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

struct TopRankingModel {
    let ranking: Int
    let itemImg: UIImage
}

extension TopRankingModel {
    static func dummy() -> [TopRankingModel] {
        return [
            TopRankingModel(ranking: 1, itemImg: UIImage(named: "poster_1")!),
            TopRankingModel(ranking: 2, itemImg: UIImage(named: "poster_2")!),
            TopRankingModel(ranking: 3, itemImg: UIImage(named: "poster_3")!),
            TopRankingModel(ranking: 4, itemImg: UIImage(named: "poster_4")!),
            TopRankingModel(ranking: 5, itemImg: UIImage(named: "vertical_poster_5")!),
            TopRankingModel(ranking: 6, itemImg: UIImage(named: "vertical_poster_6")!),
            TopRankingModel(ranking: 7, itemImg: UIImage(named: "vertical_poster_7")!),
            TopRankingModel(ranking: 8, itemImg: UIImage(named: "vertical_poster_1")!),
            TopRankingModel(ranking: 9, itemImg: UIImage(named: "vertical_poster_2")!),
            TopRankingModel(ranking: 10, itemImg: UIImage(named: "vertical_poster_3")!)
        ]
    }
}
