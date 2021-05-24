//
//  BukuBaru.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import Foundation

struct BukuResponse: Codable {
  let success: Bool
  let result : [BukuBaru]
}

struct BukuBaru: Codable, Identifiable {
  let id : Int
  let title: String
  let cover_url: String
}
