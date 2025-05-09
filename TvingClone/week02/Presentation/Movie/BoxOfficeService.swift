//
//  BoxOfficeService.swift
//  week02
//
//  Created by 조영서 on 5/9/25.
//

// BoxOfficeMovie.swift

import Foundation

struct BoxOfficeMovie: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
}

struct WeeklyBoxOfficeList: Codable {
    let weeklyBoxOfficeList: [BoxOfficeMovie]
}

struct BoxOfficeResponse: Codable {
    let boxOfficeResult: WeeklyBoxOfficeList
}

// BoxOfficeService.swift

import Foundation

final class BoxOfficeService {
    static let shared = BoxOfficeService()
    private init() {}

    private let apiKey = "922962ca37af58eed9c4203955831938"

    func fetchWeeklyBoxOffice(date: String) async throws -> [BoxOfficeMovie] {
        let urlString = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=\(apiKey)&targetDt=\(date)"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
        return decoded.boxOfficeResult.weeklyBoxOfficeList
    }
}
