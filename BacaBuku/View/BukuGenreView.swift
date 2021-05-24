//
//  BukuGenreView.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI

struct BukuGenreView: View {
  
  @ObservedObject var ApiService = GenreBukuApiService(id: "2")
  
  @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
  
  private var viewController: UIViewController? {
    self.viewControllerHolder.value
  }
  
  var body: some View {
    ZStack {
      ZStack(alignment: .topLeading) {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 20) {
            ForEach(ApiService.dataTotal?.result ?? [], id: \.id) { item in
              BukuCell(judulBuku: item.title, coverImg: item.cover_url)
                .padding(.top, 30)
                .padding(.horizontal)
                .onTapGesture {
                  self.viewController?.present(style: .fullScreen) {
                    DetailBukuView(ApiService: BukuDetailApiService(id: String(item.id)))
                      .ignoresSafeArea()
                  }
                }
            }
          }.padding(.bottom, 30)
          .padding(.top, 120)
        }
        
        HStack {
          Button(action: {
            self.viewController?.dismiss(animated: true, completion: nil)
          }, label: {
            
            Image(systemName: "chevron.left")
              .padding()
              .background(Color(.white))
              .foregroundColor(.black)
              .cornerRadius(10)
              .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0.0, y: 4)
          })
          .padding(.leading)
          .padding(.top, 60)
          
          Spacer()
          
        }
      }
    }
  }
}

struct BukuGenreView_Previews: PreviewProvider {
  static var previews: some View {
    BukuGenreView()
  }
}
