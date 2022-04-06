//
//  ContentView.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 05/04/22.
//

import SwiftUI

struct ContentView: View {
    //@State var roWSArr: [Rows]?
   // @State var title: String?
   @StateObject var viewModel = ItemListModelView()
    var body: some View {
        
        NavigationView {
            
            List(viewModel.jsonRowsArr ?? []){ item in
                ItemsSubView(items: item,title: viewModel.title)
            }
        .onAppear {
            viewModel.getItemsList { rows, title in
                    viewModel.jsonRowsArr = rows
                    viewModel.title = title
                
               
            }

        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

