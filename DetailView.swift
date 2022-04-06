//
//  DetailView.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 05/04/22.
//

import SwiftUI

struct DetailView: View {
    @State var rows: Rows?
    @State var imageurl: String?
    var body: some View {
        VStack(alignment: .center){
            if let imageurl = imageurl {
                URLImage(url: imageurl)
                    .frame(width: 350, height: 150)
                    .scaledToFit()
            }
            else{
                Image("placeholder")
                .resizable()
                .frame(width: 350, height: 150)
                .scaledToFit()
            }
        Text(rows?.description ?? "")
            .foregroundColor(.green)
            .font(.body)
            .padding()
    }
    Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
