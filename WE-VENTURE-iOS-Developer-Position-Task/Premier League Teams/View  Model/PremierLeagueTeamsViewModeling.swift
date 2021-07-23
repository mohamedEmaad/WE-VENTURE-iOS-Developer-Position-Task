//
//  PremierLeagueTeamsViewModeling.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

protocol PremierLeagueTeamsViewModeling {

    var onDataRecieved: ((Result<[Team], Error>) -> Void)? { get set }

    func getPremierLeagueTeams()

}
