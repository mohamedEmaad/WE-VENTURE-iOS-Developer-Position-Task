//
//  PremierLeagueTeamsViewModel.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

final class PremierLeagueTeamsViewModel: PremierLeagueTeamsViewModeling {
    
    var onDataRecieved: (() -> Void)?
    var onError: ((Error) -> Void)?

    var teams: [Team] = []

    private var premierLeagueTeamsUrlExtension: String = "competitions/2021/teams"
    private let repository: PremierLeagueRepository

    init(repository: PremierLeagueRepository) {
        self.repository = repository
    }

    func getPremierLeagueTeams() {
        guard let url: URL = URL(string: .baseUrl + premierLeagueTeamsUrlExtension) else {
            self.onError?(MainError.responseError(message: "CallApi:InvalidUrl".localized))

            return
        }

        self.repository.getPremierLeagueTeams(url: url) { (result) in
            switch result {
            case .failure(let error):
                self.onError?(error)
            case .success(let teams):
                self.teams = teams
            }
            self.onDataRecieved?()
        }
    }

    func getTeam(at index: Int) -> Team {
        self.teams[index]
    }
    
}
