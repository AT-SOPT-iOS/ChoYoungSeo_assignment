//
//  ProgramModel.swift
//  week02
//
//  Created by 조영서 on 5/2/25.
//

import UIKit

struct ProgramModel {
    let itemImg: UIImage
}

extension ProgramModel {
    static func dummy() -> [ProgramModel] {
        return [
            ProgramModel(itemImg: UIImage(named: "appletv_logo")!),
            ProgramModel(itemImg: UIImage(named: "kbo_logo")!),
            ProgramModel(itemImg: UIImage(named: "kbl_logo")!),
            ProgramModel(itemImg: UIImage(named: "afc_logo")!)
        ]
    }
}

