//
//  NetworkApi.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 05/04/22.
//

import Foundation
import SwiftUI

class ItemListModelView: ObservableObject{
    
    @Published var jsonObjArray: ModelJsonObject?
    @Published var title: String?
    @Published var jsonRowsArr: [Rows]?
    
    typealias ItemsCompletionHandler = ([Rows],String) -> Void
    
  static let shared = ItemListModelView()
        
    func getItemsList(completionHandler: @escaping ItemsCompletionHandler) {
        DispatchQueue.global().async {
            NetworkHandler.shared.makeAPICall(url: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json", method: .GET, success: { (data, _, error) in
                    guard let data = data else { return }
                    let responseStrInISOLatin = String(data: data, encoding: String.Encoding.isoLatin1)
                    guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                            self.jsonObjArray = try decoder.decode(ModelJsonObject.self, from: modifiedDataInUTF8Format)
                            self.title  = self.jsonObjArray?.title
                            self.jsonRowsArr =  self.jsonObjArray?.rows
                        
                            completionHandler(self.jsonRowsArr ?? [], self.title!)
                        
                            
                    } catch {
                        print(error.localizedDescription)
                    }
                },
                    failure: { (_, _, _) in
            })
        }
        
        }
}
