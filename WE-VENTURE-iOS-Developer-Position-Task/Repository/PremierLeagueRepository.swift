//
//  PremierLeagueRepository.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

final class PremierLeagueRepository {

    private let fetcher: RequestFetcher

    init(fetcher: RequestFetcher) {
        self.fetcher = fetcher
    }

    func getPremierLeagueTeams(completion: @escaping (Result<Any, Error>) -> Void) {
    }
    
}
