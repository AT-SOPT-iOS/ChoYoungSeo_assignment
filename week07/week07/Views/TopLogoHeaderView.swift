//
//  TopLogoHeaderView.swift
//  week07
//
//  Created by 조영서 on 5/30/25.
//

import SwiftUI

struct TopLogoHeaderView: View {
    var body: some View {
        HStack {
            Image("tving")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 191, height: 78)
                .clipped()
            Spacer()
            Image("search")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipped()
                .padding(.leading, 10)
            Image("tving_minilogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipped()
                .padding(.leading, 10)
        }
        .background(Color.black)
    }
}
