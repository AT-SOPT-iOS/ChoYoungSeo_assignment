//
//  FavoriteModel.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

struct FavoriteModel {
    let itemImg: UIImage
}

extension FavoriteModel {
    static func dummy() -> [FavoriteModel] {
        return [
            FavoriteModel(itemImg: UIImage(named: "horizontal_poster_1")!),
            FavoriteModel(itemImg: UIImage(named: "horizontal_poster_2")!),
            FavoriteModel(itemImg: UIImage(named: "horizontal_poster_3")!),
            FavoriteModel(itemImg: UIImage(named: "horizontal_poster_4")!),
            FavoriteModel(itemImg: UIImage(named: "horizontal_poster_5")!),
            FavoriteModel(itemImg: UIImage(named: "horizontal_poster_6")!)        ]
    }
}
