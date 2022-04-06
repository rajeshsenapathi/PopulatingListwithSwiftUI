//
//  Apihandler.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 05/04/22.
//

import Foundation
import UIKit

enum HttpMethod: String {
    case  GET
    case  POST
    case  DELETE
    case  PUT
}

class NetworkHandler : ObservableObject{
    var jsonRows: [Rows]?
    var request: URLRequest?
    var session: URLSession?
    @Published var jsonData: Data?
    
    static let shared = NetworkHandler()
    
    func makeAPICall(url: String, method: HttpMethod,
                     success:@escaping ( Data?, HTTPURLResponse?, NSError?) -> Void,
                     failure: @escaping ( Data?, HTTPURLResponse?, NSError?) -> Void) {
        request = URLRequest(url: URL(string: url)!)
        request?.httpMethod = method.rawValue
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
        session?.dataTask(with: request! as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    success(data, response, error as NSError?) } else {
                    failure(data, response as? HTTPURLResponse, error as NSError?)
                }
            } else { failure(data, response as? HTTPURLResponse, error as NSError?)
            }
            }.resume()
    }
    func getImage(url: String){
        guard let url = URL(string: url) else{return}
        URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    self.jsonData = data
                }
        }.resume()
    }
}
