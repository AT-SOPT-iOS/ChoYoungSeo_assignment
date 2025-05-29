//
//  Live.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import Foundation

struct Live: Identifiable {
    let id = UUID()
    let ranking: String
    let title: String
    let episode: String
    let rating: String
    let imageName: String
}

struct Baseball: Identifiable {
    let id = UUID()
    let imageName: String
}
