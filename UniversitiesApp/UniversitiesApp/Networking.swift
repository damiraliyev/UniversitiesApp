//
//  Networking.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 03.11.2022.
//

import Foundation
import UIKit


let urlString = "http://universities.hipolabs.com/search?"

struct University: Codable {
    let domains: [String]
    let name: String
    let webPages: [String]
    let country: String
    
    enum CodingKeys: String, CodingKey {
        case domains
        case name
        case webPages = "web_pages"
        case country
    }
    
    static func makeSkeleton() -> University {
           return University(domains: [], name: "", webPages: ["----------"], country: "")
    }
}

//let json =


enum NetworkError: Error {
    case serverError
    case decodingError
    case badUrl
}

func fetchUniversities(country: String?="", completion: @escaping (Result<[University], NetworkError>) -> Void) {
    var countryName = ""
    if country != nil {
        countryName = "country=\(country!)"
    }

    guard let url = URL(string: urlString + countryName) else {
        print(urlString + countryName)
        completion(.failure(.badUrl))
        return
    }
    
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        DispatchQueue.main.async {
            guard let data = data, error == nil else{
                completion(.failure(.serverError))
                return
            }
            
            do {
                let university = try JSONDecoder().decode([University].self, from: data)
                completion(.success(university))
            } catch {
                completion(.failure(.decodingError))
            }

        }
       
    }.resume()
}



