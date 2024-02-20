//
//  APIHandler.swift
//  GSA
//
//  Created by IPS-177  on 20/02/24.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    private init() {}
    
    func fetchData(completion: @escaping (Result<Gsamodel, Error>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?type=movie&apikey=5d81e1ce&page=1&s=guardians") else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "ServerError", code: 0, userInfo: nil)))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    // Decode the JSON data into a Gsamodel object
                    let gsamodel = try decoder.decode(Gsamodel.self, from: data)
                    completion(.success(gsamodel))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
