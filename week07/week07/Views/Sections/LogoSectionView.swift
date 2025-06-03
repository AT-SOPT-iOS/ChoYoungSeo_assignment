//
//  LogoSectionView.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import SwiftUI

struct LogoSectionView: View {
    let logos: [Logo]
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 12) {
                    ForEach(logos) { logo in
                        VStack(alignment: .leading) {
                            Image(logo.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 45)
                                .clipped()
                                .cornerRadius(4)
                        }
                    }
                }
            }
            .padding(.horizontal, 12)
        }
    }
