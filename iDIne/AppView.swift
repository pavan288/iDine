//
//  AppView.swift
//  iDIne
//
//  Created by Pavan Powani on 05/10/19.
//  Copyright © 2019 Pavan Powani. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }

            OrderView()
                .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Order")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
