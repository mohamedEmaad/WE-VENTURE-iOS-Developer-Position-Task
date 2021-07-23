//
//  File.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

protocol LeagueTeamInfoViewModeling {

    var onDataRecieved: (() -> Void)? { get set }
    var onError: ((Error) -> Void)? { get set }
    
    var team: Team { get set }

    func getLeagueTeamInfo()
    func getSquad(at index: Int) -> Squad

}
