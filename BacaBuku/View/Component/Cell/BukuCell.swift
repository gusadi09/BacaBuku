//
//  BukuCell.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI
import Kingfisher

struct BukuCell: View {
  
  var judulBuku = "test"
  var coverImg = "covers%2Fada-apa-dengan-28.jpg?download=false"
  
  var body: some View {
    let url = "https://cabaca.id:8443/api/v2/files/\(coverImg)&api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948"
    
    HStack {
      KFImage(URL(string: url))
        .resizable()
        .loadImmediately()
        .loadDiskFileSynchronously()
        .cacheMemoryOnly()
        .fade(duration: 0.5)
        .onProgress { receivedSize, totalSize in  }
        .onSuccess { result in  }
        .onFailure { error in }
        .frame(width: 80, height: 100)
        .cornerRadius(15)
      
      Text(judulBuku)
        .font(.system(size: 22))
      
      Spacer()
      
      Image(systemName: "chevron.right")
    }
    .padding()
    .padding(.vertical)
    .background(Color(.white))
    .cornerRadius(20)
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0.0, y: 4)
  }
}

struct BukuCell_Previews: PreviewProvider {
  static var previews: some View {
    BukuCell(judulBuku: "test", coverImg: "covers%2Fada-apa-dengan-28.jpg?download=false")
  }
}
