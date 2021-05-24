//
//  Penulis.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import Foundation

struct PenulisResponse: Codable {
  let success: Bool
  let result : Penulis
}

struct Penulis: Codable, Identifiable {
  let id : Int
  let name: String
  let photo_url: String
  let deskripsi: String
}
