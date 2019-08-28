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
    let postcode: String?
    
    private enum CodingKeys: String, CodingKey {
        case street = "street", city = "city", state = "state", postcode = "postcode"
    }
    
    init(street: String, city: String, state: String, postcode: String? ) {
        self.street = street
        self.city = city
        self.state = state
        self.postcode = postcode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        street = try container.decode(String.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        
        if let value = try? container.decode(Int.self, forKey: .postcode) {
            postcode = String(value)
        } else {
            postcode = try container.decode(String.self, forKey: .postcode)
        }
    }
}

