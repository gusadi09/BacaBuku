//
//  ContentView.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView {
        BukuView()
          .tabItem {
            Image(systemName: "book")
            Text("Buku Terbaru")
          }
        
        GenreView()
          .tabItem {
            Image(systemName: "books.vertical")
            Text("Genre Buku")
          }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
