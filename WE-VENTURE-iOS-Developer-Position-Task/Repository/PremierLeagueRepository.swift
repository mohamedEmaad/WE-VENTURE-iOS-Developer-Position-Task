//
//  PremierLeagueRepository.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

final class PremierLeagueRepository {

    private let fetcher: RequestHandler
    private let decoder: Decoder

    init(fetcher: RequestHandler, decoder: Decoder) {
        self.fetcher = fetcher
        self.decoder = decoder
    }

    func getPremierLeagueTeams(url: URL, completion: @escaping (Result<[Team], Error>) -> Void) {
        self.fetcher.execute(url: url, requestType: .get, body: nil) { (data, _, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }

                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(MainError.responseError(message: "ReturnedData:Nil".localized)))
                }

                return
            }

            guard let decodedResponse: PremierLeagueTeamsResponse = self.decoder.decode(of: PremierLeagueTeamsResponse.self, data: data) else {
                DispatchQueue.main.async {
                    completion(.failure(MainError.responseError(message: "DecodingError:Text".localized)))
                }

                return
            }

            DispatchQueue.main.async {
                completion(.success(decodedResponse.teams ?? []))
            }
        }
    }
    
}
