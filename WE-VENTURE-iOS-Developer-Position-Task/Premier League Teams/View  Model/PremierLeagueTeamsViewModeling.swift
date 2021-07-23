//
//  PremierLeagueTeamsViewModeling.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

protocol PremierLeagueTeamsViewModeling {

    var onDataRecieved: (() -> Void)? { get set }
    var onError: ((Error) -> Void)? { get set }
    var teams: [Team] { get set }

    func getPremierLeagueTeams()
    func getTeam(at index: Int) -> Team

}
