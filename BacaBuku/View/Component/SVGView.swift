//
//  SVGView.swift
//  FootbalTeams
//
//  Created by Gus Adi on 12/05/21.
//

import SwiftUI
import SVGKit

struct SVGView:UIViewRepresentable
{
  var url:URL
  func makeUIView(context: Context) -> SVGKFastImageView {
    
    
    let svgImage = SVGKImage(contentsOf: url)
    svgImage?.size.width = 75
    svgImage?.size.height = 75
    return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
     
  }
  func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
     
  }
   
   
}

