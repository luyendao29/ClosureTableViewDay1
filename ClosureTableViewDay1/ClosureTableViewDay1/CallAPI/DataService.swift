//
//  DataService.swift
//  ClosureTableViewDay1
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit
 
class DataService {
    static let sharing: DataService = DataService()
    
    func getData<T: Codable>(urlString: String, completion: @escaping(T)->()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("fullURLRequest: ", url)
                print("params: ", url.query as Any)
                print("header: ", url.relativeString)
                print("Response json:\n", dataString)
            }
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(data)
                }
            } catch let error {
                print("decode error: ", error)
            }
            }.resume()
    }
}
