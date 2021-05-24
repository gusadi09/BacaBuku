//
//  GenreBukuApiService.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import Foundation
import SwiftUI
import Combine

class GenreBukuApiService: ObservableObject {
  
  let objectWillChange = ObservableObjectPublisher()
  
  
  @Published var dataTotal: BukuResponse? {
    willSet {
      objectWillChange.send()
    }
  }
  
  let id: String?
  
  @Published var isLoading = true
  
  init(id: String) {
    self.id = id
    guard let url = URL(string: "https://cabaca.id:8443/api/v2/book/category?id=\(id)") else {
      fatalError("Invalid URL")
    }
    
    let headers = "25e0bf00ab2fa7f03a9fa57035139e47ccb28c20658f6de907b8011347e369fb"
    
    var urlRequest = URLRequest(url: url)
    
    urlRequest.setValue(headers, forHTTPHeaderField: "x-dreamfactory-api-key")
    
    URLSession(configuration: .default).dataTask(with: urlRequest) { (data, response, error) in
      guard let data = data, error == nil else {
        return
      }
      
      let result = try? JSONDecoder().decode(BukuResponse.self, from: data)
      
      if let result = result {
        
        self.isLoading = false
        
        DispatchQueue.main.async {
          self.dataTotal = result
        }
      }
    }.resume()
  }
}
