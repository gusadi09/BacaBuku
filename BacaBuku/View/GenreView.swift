//
//  GenreView.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI

struct GenreView: View {
  @ObservedObject var genreApiService = GenreApiService()
  
  @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
   
  private var viewController: UIViewController? {
    self.viewControllerHolder.value
  }
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        ForEach(genreApiService.dataTotal?.resource ?? [], id: \.id) { item in
          GenreCell(genreName: item.title)
            .padding(.top, 30)
            .padding(.horizontal)
            .onTapGesture {
              self.viewController?.present(style: .fullScreen) {
                BukuGenreView(ApiService: GenreBukuApiService(id: String(item.id)))
                  .ignoresSafeArea()
              }
            }
        }.padding(.bottom, 30)
        
      }
      .navigationTitle("Genre Buku")
    }
  }
}

struct GenreView_Previews: PreviewProvider {
  static var previews: some View {
    GenreView()
  }
}
