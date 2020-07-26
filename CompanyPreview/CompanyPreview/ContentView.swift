//
//  ContentView.swift
//  CompanyPreview
//
//  Created by Artsiom Sakratar on 2/14/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height: 300)
            CircleImage().offset(y: -50).padding(.bottom, -50)
            VStack(alignment: .leading) {
                Text("Epic Technologies").font(.title).foregroundColor(Color.red)
                HStack {
                    Text("Software company")
                    Spacer()
                    Text("Minsk")
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
