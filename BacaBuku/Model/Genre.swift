//
//  Genre.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import Foundation

struct GenList: Codable {
  let resource: [Genre]
}

struct Genre: Codable {
  let id: Int
  let title: String
  let icon_url: String
  let count: Int
}
