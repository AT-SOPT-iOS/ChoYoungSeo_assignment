//
//  LiveModel.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

struct LiveModel {
    let ranking: Int
    let itemImg: UIImage
    let title: String
    let subTitle: String
    let rating: String
}

extension LiveModel {
    static func dummy() -> [LiveModel] {
        return [
            LiveModel(ranking: 1, itemImg: UIImage(named: "horizontal_poster_1")!, title: "뿅뿅지구오락실2", subTitle: "2화", rating: "27.2%"),
            LiveModel(ranking: 2, itemImg: UIImage(named: "horizontal_poster_2")!, title: "진격의 명작", subTitle: "5화", rating: "22.8%"),
            LiveModel(ranking: 3, itemImg: UIImage(named: "horizontal_poster_3")!, title: "놀면 뭐하니?", subTitle: "148화", rating: "19.3%"),
            LiveModel(ranking: 4, itemImg: UIImage(named: "horizontal_poster_4")!, title: "라디오스타", subTitle: "812화", rating: "16.1%"),
            LiveModel(ranking: 5, itemImg: UIImage(named: "horizontal_poster_5")!, title: "유퀴즈온더블럭", subTitle: "223화", rating: "14.5%"),
            LiveModel(ranking: 6, itemImg: UIImage(named: "horizontal_poster_6")!, title: "문명특급", subTitle: "55화", rating: "11.9%")
        ]
    }
}
