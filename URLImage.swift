//
//  URLImage.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 05/04/22.
//

import SwiftUI

struct URLImage: View {
    let placeholder: String
    let url: String
    @ObservedObject var imgDownloader = NetworkHandler()
    
    init(url: String,placeholder: String = "placeholder"){
        self.url = url
        self.placeholder = placeholder
        self.imgDownloader.getImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imgDownloader.jsonData{
            do {
                return Image(uiImage: (UIImage(data: data) ?? UIImage(data: try! Data(contentsOf: URL(string: "https://www.firstbenefits.org/wp-content/uploads/2017/10/placeholder-150x150.png")!)))!).resizable()
                    .scaledToFit()
                   .cornerRadius(10)
            }
        }
        else{
            return Image("placeholder").resizable()
                .scaledToFit()
                .cornerRadius(10)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://www.firstbenefits.org/wp-content/uploads/2017/10/placeholder-150x150.png")
    }
}
