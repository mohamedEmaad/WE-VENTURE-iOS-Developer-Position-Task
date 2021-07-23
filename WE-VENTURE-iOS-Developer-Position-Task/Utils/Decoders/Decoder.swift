//
//  Decoder.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

final class Decoder: ResponseDecoder {

    func decode<T>(of type: T.Type, data: Data) -> T? where T : Decodable {
        let encodedData: T? = try? JSONDecoder().decode(type, from: data)
        return encodedData
    }

}
