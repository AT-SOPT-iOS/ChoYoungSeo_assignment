//
//  BaseballSectionView.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import SwiftUI

struct BaseballSectionView: View {
    let baseballs: [Baseball]
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 12) {
                ForEach(baseballs) { baseball in
                    VStack {
                        Image(baseball.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 50)
                            .clipped()
                    }
                }
            }
        }
    }
}
