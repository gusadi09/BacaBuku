//
//  BukuDetail.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import Foundation

struct BukuDetailResponse: Codable {
  let success: Bool
  let result : BukuDetail
}

struct BukuDetail: Codable, Identifiable {
  let id : Int
  let title: String
  let cover_url: String
  let synopsis: String
  let Writer_by_writer_id: Writer
}

struct Writer: Codable, Identifiable {
  let id: Int
  let user_id: Int
  let User_by_user_id: User
}

struct User: Codable, Identifiable {
  let id : Int
  let name: String
  let photo_url: String
}
