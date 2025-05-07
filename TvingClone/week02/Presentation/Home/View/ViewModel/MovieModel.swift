//
//  MovieModel.swift
//  week02
//
//  Created by 조영서 on 5/1/25.
//

import UIKit

struct MovieModel {
    let itemImg: UIImage
}

extension MovieModel {
    static func dummy() -> [MovieModel] {
        return [
            MovieModel(itemImg: UIImage(named: "vertical_poster_1")!),
            MovieModel(itemImg: UIImage(named: "vertical_poster_2")!),
            MovieModel(itemImg: UIImage(named: "vertical_poster_3")!),
            MovieModel(itemImg: UIImage(named: "vertical_poster_4")!),
            MovieModel(itemImg: UIImage(named: "vertical_poster_5")!),
            MovieModel(itemImg: UIImage(named: "vertical_poster_6")!),
            MovieModel(itemImg: UIImage(named: "vertical_poster_7")!)
        ]
    }
}
