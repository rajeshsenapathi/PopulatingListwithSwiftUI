//
//  swiftui.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 06/04/22.
//

import Foundation
import SwiftUI
struct ItemsSubView: View {
   @State var items: Rows?
   @State var title: String?
    var body: some View {
        ZStack(alignment: .leading) {
            NavigationLink(destination: DetailView(rows: items, imageurl: items?.imageHref)) {
            }.opacity(0)
            HStack {
                URLImage(url: items?.imageHref ?? "https://www.firstbenefits.org/wp-content/uploads/2017/10/placeholder-150x150.png")
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .padding(.vertical,10)
                Text(items?.title ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.pink)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                    .padding(5)
            }
        }.navigationTitle(title ?? "")
    }
}
