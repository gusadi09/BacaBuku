//
//  DetailPenulisView.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI
import Kingfisher

struct DetailPenulisView: View {
  
  @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
  
  private var viewController: UIViewController? {
    self.viewControllerHolder.value
  }
  
  @ObservedObject var ApiService = PenulisApiService(id: "65387")
  
  var body: some View {
    ZStack {
      ZStack(alignment: .topLeading) {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .leading) {
            HStack {
              KFImage(URL(string: "https://cabaca.id:8443/api/v2/files/\(ApiService.dataTotal?.result.photo_url ?? "")&api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948"))
                .resizable()
                .loadImmediately()
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.5)
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in  }
                .onFailure { error in }
                .frame(width: 120, height: 120)
                .cornerRadius(60)
              
              Text(ApiService.dataTotal?.result.name ?? "")
                .font(.system(size: 28)).bold()
            }
            
            Text("Bio")
              .font(.system(size: 20)).bold()
              .foregroundColor(.gray)
              .padding(.top)
              .padding(.horizontal)
              .padding(.bottom, 15)
            
            Text(ApiService.dataTotal?.result.deskripsi ?? "")
              .font(.system(size: 16))
              .padding(.horizontal)
          }
          .padding(.top, 150)
          .padding(.bottom, 20)
          .padding(.horizontal)
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

struct DetailPenulisView_Previews: PreviewProvider {
  static var previews: some View {
    DetailPenulisView()
  }
}
