//
//  NetworkService.swift
//  Hotels Test App
//
//  Created by Andrey Kapitalov on 28.07.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getHotelsList(completion: @escaping (Result<Data, Error>) -> Void)
    func getHotelDetail(with id: Int, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkServise: NetworkServiceProtocol {
    
    func getHotelsList(completion: @escaping (Result<Data, Error>) -> Void) {
        
    }
    
    func getHotelDetail(with id: Int, completion: @escaping (Result<Data, Error>) -> Void) {
        
    }
    
    
    private func networkRequest<T: Decodable>(fromURL url: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url.build(path: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error)  in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error.localizedDescription as! Error))
                }
            }
        } .resume()
    }
       
    
    
}
