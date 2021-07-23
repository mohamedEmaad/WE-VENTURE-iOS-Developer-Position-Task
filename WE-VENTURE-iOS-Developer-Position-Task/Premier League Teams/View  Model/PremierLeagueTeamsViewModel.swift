//
//  PremierLeagueTeamsViewModel.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

final class PremierLeagueTeamsViewModel: PremierLeagueTeamsViewModeling {
    
    var onDataRecieved: ((Result<[Team], Error>) -> Void)?

    private var premierLeagueTeamsUrlExtension: String = "competitions/2021/teams"
    private let repository: PremierLeagueRepository

    init(repository: PremierLeagueRepository) {
        self.repository = repository
    }

    func getPremierLeagueTeams() {
        guard let url: URL = URL(string: .baseUrl + premierLeagueTeamsUrlExtension) else {
            self.onDataRecieved?(.failure(MainError.responseError(message: "CallApi:InvalidUrl".localized)))

            return
        }

        self.repository.getPremierLeagueTeams(url: url) { (result) in
            self.onDataRecieved?(result)
        }
    }
    
}
