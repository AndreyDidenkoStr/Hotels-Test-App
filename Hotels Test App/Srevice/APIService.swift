//
//  APIService.swift
//  Hotels Test App
//
//  Created by Andrey Kapitalov on 28.07.2022.
//
import Foundation

    enum Endpoint {
        
        private var baseURL: URL { URL(string: "https://raw.githubusercontent.com/iMofas/ios-android-test/master/")! }
        
        case baseURL
        case id (Int)
        case imageID (String)
        
        func build(path: Self) -> URL? {
            return baseURL.appendingPathComponent(self.path())
        }
        
        private func path() -> String {
            switch self {
            case .baseURL:
                return "0777.json"
            case .id(let id):
                return "\(id).json"
            case .imageID(let imageID):
                return "\(imageID)"
            }
        }
    }

