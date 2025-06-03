//
//  HomeHeaderView.swift
//  week07
//
//  Created by 조영서 on 5/30/25.
//

import SwiftUI

struct HomeTabBarView: View {
    let tabs = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HStack(spacing: 28) {
                ForEach(tabs, id: \.self) { tab in
                    Text(tab)
                }
            }
            .font(.custom("Pretendard-Regular", size: 17))
            .foregroundColor(.white)
            .frame(height: 44)
            .frame(maxWidth: .infinity)

            Color.white
                .frame(width: 15, height: 3)
                .offset(x: 21, y: 0)

            Color.gray4
                .frame(height: 1)
                .frame(maxWidth: .infinity)
        }
        .background(Color.black)
    }
}
