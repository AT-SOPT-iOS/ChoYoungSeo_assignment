//
//  PickSectionView.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import SwiftUI

struct PickSectionView: View {
    let title: String
    let favorites: [Favorite]
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 15))
                    .foregroundColor(.white)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 8) {
                        ForEach(favorites) { favorite in
                            VStack(alignment: .leading, spacing: 4) {
                                Image(favorite.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 160, height: 90)
                                    .clipped()
                                    .cornerRadius(3)
                                    .padding(.bottom, 10)
                            }
                    }
                }
            }
        }
        .padding(.horizontal, 12)
    }
}
