//
//  HomeView.swift
//  week07
//
//  Created by 조영서 on 5/27/25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TopLogoHeaderView()
        Spacer(minLength: 0)

        HomeTabBarView()
        Spacer(minLength: 0)
        
        ScrollView {
            VStack(spacing: 32) {
                Image("main_poster")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 375, height: 400)
                    .clipped()
                
                RankingSectionView(title: "오늘의 티빙 TOP 20", rankings: mockRankings)
                LiveSectionView(title: "실시간 인기 LIVE", lives: mockLives)
                MovieSectionView(title: "실시간 인기 영화", movies: mockMovies)
                BaseballSectionView(baseballs: mockBaseballs)
                LogoSectionView(logos: mockLogos)
                PickSectionView(title: "김가현PD의 인생작 TOP 5", favorites: mockFavorites)
                
                FooterView()

            }
            .padding(.top, 16)
        }
        .background(Color.black)
    }
}
