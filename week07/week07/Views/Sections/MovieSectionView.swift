//
//  MovieSectionView.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import SwiftUI

struct MovieSectionView: View {
    let title: String
    let movies: [Movie]
    
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
                    ForEach(movies) { movie in
                        VStack(alignment: .leading, spacing: 4) {
                            Image(movie.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 98, height: 146)
                                .clipped()
                                .cornerRadius(3)
                                .padding(.bottom, 10)
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
        }
    }
}
