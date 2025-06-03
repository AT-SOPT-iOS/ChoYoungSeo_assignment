//
//  HomeTabBarView.swift
//  week07
//
//  Created by 조영서 on 5/30/25.
//

import SwiftUI

struct HomeTabBarView: View {
    let tabs = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    @State private var selectedTab: String = "홈"
    @Namespace private var indicatorNamespace

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HStack(spacing: 28) {
                ForEach(tabs, id: \.self) { tab in
                    Text(tab)
                        .font(.custom("Pretendard-Regular", size: 17))
                        .foregroundColor(selectedTab == tab ? .white : .gray2)
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .preference(key: TabPreferenceKey.self, value: [tab: geo.frame(in: .named("TabBarArea"))])
                            }
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                selectedTab = tab
                            }
                        }
                }
            }
            .frame(height: 44)
            .frame(maxWidth: .infinity)

            Color.gray4
                .frame(height: 1)
                .frame(maxWidth: .infinity)
        }
        .background(Color.black)
        .coordinateSpace(name: "TabBarArea")
        .overlayPreferenceValue(TabPreferenceKey.self) { preferences in
            GeometryReader { proxy in
                if let frame = preferences[selectedTab] {
                    Color.white
                        .frame(width: frame.width, height: 3)
                        .offset(x: frame.minX, y: 41)
                        .animation(.easeInOut(duration: 0.25), value: selectedTab)
                }
            }
        }
    }
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: [String: CGRect] = [:]
    static func reduce(value: inout [String: CGRect], nextValue: () -> [String: CGRect]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
