//
//  LiveSectionView.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import SwiftUI

struct LiveSectionView: View {
    let title: String
    let lives: [Live]
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 15))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("더보기")
                    .font(.custom("Pretendard-Bold", size: 12))
                    .foregroundColor(.gray2)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 4)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 12) {
                    ForEach(lives) { live in
                        VStack(alignment: .leading, spacing: 4) {
                            Image(live.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 80)
                                .clipped()
                                .cornerRadius(3)
                                .padding(.bottom, 10)
                            
                            HStack(alignment: .top) {
                                Text(live.ranking)
                                    .font(.custom("Pretendard-Bold", size: 19))
                                    .foregroundColor(.white)
                                    .padding(.leading, 6)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(live.title)
                                        .font(.custom("Pretendard-Medium", size: 10))
                                        .foregroundColor(.white)
                                    Text(live.episode)
                                        .font(.custom("Pretendard-Regular", size: 10))
                                        .foregroundColor(.gray2)
                                    Text(live.rating)
                                        .font(.custom("Pretendard-Regular", size: 10))
                                        .foregroundColor(.gray2)
                                }
                            }
                        }
                        .padding(.trailing, 8)
                    }
                }
                .frame(height: 130)
                .padding(.horizontal, 12)
            }
        }
    }
}
