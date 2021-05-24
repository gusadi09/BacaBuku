//
//  DetailBukuView.swift
//  BacaBuku
//
//  Created by Gus Adi on 24/05/21.
//

import SwiftUI
import Kingfisher

struct DetailBukuView: View {
  
  @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
  
  private var viewController: UIViewController? {
    self.viewControllerHolder.value
  }
  
  @ObservedObject var ApiService = BukuDetailApiService(id: "569")
  
  var body: some View {
    ZStack {
      ZStack(alignment: .topLeading) {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 20) {
            HStack(spacing: 20) {
              KFImage(URL(string: "https://cabaca.id:8443/api/v2/files/\(ApiService.dataTotal?.result.cover_url ?? "")&api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948"))
                .resizable()
                .loadImmediately()
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.5)
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in  }
                .onFailure { error in }
                .frame(width: 165, height: 220)
                .cornerRadius(20)
              
              VStack(alignment: .leading, spacing: 30) {
                Text(ApiService.dataTotal?.result.title ?? "")
                  .font(.system(size: 24))
                  .bold()
                
                Button(action: {
                  self.viewController?.present(style: .fullScreen) {
                    DetailPenulisView(ApiService: PenulisApiService(id: String(ApiService.dataTotal?.result.Writer_by_writer_id.User_by_user_id.id ?? 0)))
                      .ignoresSafeArea()
                  }
                }, label: {
                  HStack {
                    KFImage(URL(string: "https://cabaca.id:8443/api/v2/files/\(ApiService.dataTotal?.result.Writer_by_writer_id.User_by_user_id.photo_url ?? "")&api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948"))
                      .resizable()
                      .loadImmediately()
                      .loadDiskFileSynchronously()
                      .cacheMemoryOnly()
                      .fade(duration: 0.5)
                      .onProgress { receivedSize, totalSize in  }
                      .onSuccess { result in  }
                      .onFailure { error in }
                      .frame(width: 50, height: 50)
                      .cornerRadius(40)
                    
                    Text(ApiService.dataTotal?.result.Writer_by_writer_id.User_by_user_id.name ?? "")
                  }
                })
              }
            }
            .padding(.top, 130)
            .padding(.horizontal)
            
            Text("""
<p style=\"margin: 0cm; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EN-US\" style=\"font-size: 11pt; font-family: Calibri, sans-serif;\">Frisna semakin tertinggal di antara  teman-teman sepantarannya yang sudah menikah dan punya anak. Label jomlo abadi  melekat erat pada dirinya, malah akan ketambahan label baru: perawan tua.  Frisna sampai bosan ditanyai berapa umurnya, apa saja pencapaiannya, dan yang  paling menyebalkan: mengapa belum menikah. Bisa nggak, sih, orang-orang nggak  kebanyakan komentar?!<u1:p></u1:p></span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\"><o:p></o:p></span></p><p style=\"margin: 0cm; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EN-US\" style=\"font-size: 11pt; font-family: Calibri, sans-serif;\">Berbeda  dengan Frisna yang pengin menikah tapi jodohnya belum kelihatan, Yosi justru  bertekad tidak akan menikah. Ia bahagia hidup melajang tanpa dibebani urusan  rumah tangga, apalagi anak. Lebih-lebih, apa yang telah terjadi pada ayah dan  ibunya menunjukkan kepadanya bahwa kehidupan pernikahan yang indah hanya ada di  dongeng-dongeng. \"Bahagia selama-lamanya\" itu omong kosong!<u1:p></u1:p></span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\"><o:p></o:p></span></p><p style=\"margin: 0cm; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EN-US\" style=\"font-size: 11pt; font-family: Calibri, sans-serif;\">Ester  tidak seperti Frisna ataupun Yosi, ia sudah menikah dan memiliki putri  kecil&nbsp; bernama Tata yang sangat ia jaga dan kasihi. Walau begitu, tidak  ada lagi seorang pendamping di sisinya. Meski ia hanya ingin bekerja dengan  baik dan hidup dengan tenang, orang-orang selalu memandangnya sebelah mata  dengan segala rumor yang entah muncul dari mana. Kapan, sih, mereka akan  berhenti?<u1:p></u1:p></span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\"><o:p></o:p></span></p><p style=\"margin:0cm;text-align:justify;text-justify:inter-ideograph\">            </p><p style=\"margin: 0cm; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"EN-US\" style=\"font-size: 11pt; font-family: Calibri, sans-serif;\">Tiga wanita dengan sifat yang  berbeda-beda, bertemu secara tidak sengaja. Keributan besar yang melibatkan  mereka dengan seorang bayi yang terancam dijual, membuat ketiganya bersepakat  untuk menghadapi usia 28 bersama.</span><span style=\"font-size: 10.5pt; font-family: Arial, sans-serif;\"><o:p></o:p></span></p>
""")
              .padding(.horizontal)
              .padding(.bottom, 40)
          }
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

struct DetailBukuView_Previews: PreviewProvider {
  static var previews: some View {
    DetailBukuView()
  }
}
