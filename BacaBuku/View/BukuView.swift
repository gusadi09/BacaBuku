//
//  BukuView.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI

struct BukuView: View {
  @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
  
  private var viewController: UIViewController? {
    self.viewControllerHolder.value
  }
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          
          HStack {
            Text("Buku Merupakan Jendela Ilmu")
              .font(.system(size: 40))
              .fontWeight(.bold)
              .foregroundColor(.black)
              .padding(.vertical)
              .padding(.trailing)
            
            Spacer()
          }
          
          HStack {
            Text("#BacaBuku")
              .font(.system(size: 25))
              .fontWeight(.bold)
              .foregroundColor(.black)
              .padding(.vertical)
            
            Spacer()
          }
          
        }
        .padding(.all)
        .background(Color(.white))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0.0, y: 4)
        .padding()
        
        HStack(spacing: 20) {
          
        }
        
        .navigationTitle("Buku Terbaru")
      }
    }
  }
}

struct BukuView_Previews: PreviewProvider {
  static var previews: some View {
    BukuView()
  }
}
