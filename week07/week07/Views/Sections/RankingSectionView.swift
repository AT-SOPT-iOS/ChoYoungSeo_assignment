//
//  RankingSectionView.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import SwiftUI

struct RankingSectionView: View {
    let title: String
    let rankings: [Ranking]
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 15))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 4)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 12) {
                    ForEach(rankings) { ranking in
                        HStack(alignment: .bottom) {
                            Text(ranking.ranking)
                                .font(.custom("Pretendard-SemiBold", size: 50))
                                .foregroundColor(.white)
                                .padding(.leading, 6)
                            
                        VStack(alignment: .leading, spacing: 4) {
                            Image(ranking.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 98, height: 146)
                                .clipped()
                                .cornerRadius(3)
                                .padding(.bottom, 10)
                            }
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
        }
    }
}
