//
//  Extensions.swift
//  
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

extension String {

    @inlinable static var baseUrl: Self {
        "https://api.football-data.org/v2/"
    }

    @inlinable static var token: Self {
        "6653ab8b8a844fd8b2d879f21919e2d5"
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

extension Error {

    func getErrorMessage() -> String {
        switch self {
        case let self as MainError:
            return self.getErrorMessage()
        default:
            return self.localizedDescription
        }
    }

}
