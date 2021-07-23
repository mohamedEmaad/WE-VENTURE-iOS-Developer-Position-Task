//
//  PremierLeagueTeamsViewModel.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

final class PremierLeagueTeamsViewModel: PremierLeagueTeamsViewModeling {
    
    var onDataRecieved: ((Result<Any, Error>) -> Void)?

    private let repository: PremierLeagueRepository

    init(repository: PremierLeagueRepository) {
        self.repository = repository
    }

    func getPremierLeagueTeams() {

    }
    
}
