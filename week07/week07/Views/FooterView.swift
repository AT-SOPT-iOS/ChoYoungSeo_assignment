//
//  FooterView.swift
//  week07
//
//  Created by 조영서 on 6/3/25.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 32) {
            HStack {
                HStack(spacing: 4) {
                    Text("공지")
                        .font(.custom("Pretendard-Medium", size: 11))
                        .foregroundColor(.gray2)
                    Text("티빙 계정 공유 정책 추가 안내")
                        .font(.custom("Pretendard-Medium", size: 11))
                        .foregroundColor(.white)
                }
                Spacer()
                Image("forward")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 18, height: 18)
                    .clipped()
            }
            .padding(.horizontal, 12)
            .frame(width: 347, height: 50)
            .background(Color.gray4)
            .cornerRadius(5)

            HStack {
                VStack(spacing: 4) {
                    HStack(spacing: 3) {
                        Text("고객문의")
                        Text("·")
                        Text("이용약관")
                        Text("·")
                            .padding(.leading, 3)
                        Text("개인정보처리방침")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 3) {
                        Text("사업자정보")
                        Text("·")
                        Text("인재채용")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Pretendard-Medium", size: 11))
                .foregroundColor(.gray2)
                .padding(.horizontal, 12)
            }
        }
    }
}
