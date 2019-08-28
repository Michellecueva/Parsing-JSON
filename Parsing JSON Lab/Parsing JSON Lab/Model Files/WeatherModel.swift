//
//  WeatherModel.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation


struct WeatherModel: Codable {
    let list: [listWrapper]
}

struct listWrapper: Codable {
    let name: String
    let main: mainWrapper
    let weather: [weatherWrapper]
    
    static func getListInfo(data: Data) throws -> [listWrapper] {
        do {
            let list = try
            JSONDecoder().decode(WeatherModel.self, from: data)
            return list.list
        } catch {
            throw JSON.decodingError(error)
        }
    }
    
    
}

struct mainWrapper: Codable {
    let temp: Double
}

struct weatherWrapper: Codable {
    let main: String
}
