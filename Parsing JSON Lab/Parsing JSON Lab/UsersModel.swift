//
//  UsersModel.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

struct UsersModel: Codable {
    let results: [ResultsWrapper]
}

struct ResultsWrapper: Codable {
    let name: NameWrapper
    let email: String
    let phone: String
    let dob: DobWrapper
    let location: LocationWrapper
    
    static func getResults(data: Data) throws -> [ResultsWrapper] {
        do {
            let results = try
            JSONDecoder().decode(UsersModel.self, from: data)
            return results.results
        } catch {
            throw JSON.decodingError(error)
        }
    }
    
    func getFullName() -> String {
        return "\(self.name.title). \(self.name.first) \(self.name.last)"
    }
}

struct NameWrapper: Codable {
    let title: String
    let first: String
    let last: String
}

struct DobWrapper: Codable {
    let date: String
}

struct LocationWrapper: Codable {
    let street: String
    let city: String
    let state: String
//    let postcode: Data gives this as an Int sometimes and as a String other times 
}

