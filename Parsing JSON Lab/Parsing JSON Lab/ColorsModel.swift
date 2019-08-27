//
//  ColorsModel.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation


enum JSON: Error {
    case decodingError(Error)
}

struct ColorModel: Codable {
    let colors: [colorResults]
}

struct colorResults: Codable {
    let hex: hexWrapper
    let rgb: rgbWrapper
    let name: nameWrapper
    
    static func getColorInfo(data: Data) throws -> [colorResults] {
        do {
            let colors = try
                JSONDecoder().decode(ColorModel.self, from: data)
            return colors.colors
        } catch {
            throw JSON.decodingError(error)
        }
    }


struct hexWrapper: Codable {
    let value: String
}

struct rgbWrapper: Codable {
    let fraction: fractionWrapper
    let value: String
}
    
    struct fractionWrapper: Codable {
        let r: Double
        let g: Double
        let b: Double
    }
struct nameWrapper: Codable {
    let value: String
}

}





