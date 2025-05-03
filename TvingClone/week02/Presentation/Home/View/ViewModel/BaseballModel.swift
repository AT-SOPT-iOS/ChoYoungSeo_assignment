//
//  BaseballModel.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

struct BaseballModel {
    let itemImg: UIImage
}

extension BaseballModel {
    static func dummy() -> [BaseballModel] {
        return [
            BaseballModel(itemImg: UIImage(named: "hanwha")!),
            BaseballModel(itemImg: UIImage(named: "kia")!),
            BaseballModel(itemImg: UIImage(named: "lg")!),
            BaseballModel(itemImg: UIImage(named: "ssg")!),
            BaseballModel(itemImg: UIImage(named: "doosan")!),
            BaseballModel(itemImg: UIImage(named: "kt")!),
            BaseballModel(itemImg: UIImage(named: "nc")!),
            BaseballModel(itemImg: UIImage(named: "lotte")!),
            BaseballModel(itemImg: UIImage(named: "kiwoom")!),
            BaseballModel(itemImg: UIImage(named: "samsung")!)
        ]
    }
}

