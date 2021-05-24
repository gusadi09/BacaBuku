//
//  GenreCell.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI

struct GenreCell: View {
  var genreName = "test"

  var body: some View {
    HStack {
      Text(genreName)
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

struct GenreCell_Previews: PreviewProvider {
  static var previews: some View {
    GenreCell()
  }
}
