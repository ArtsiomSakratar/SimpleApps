//
//  ContentView.swift
//  SwiftUI 1
//
//  Created by Artsiom Sakratar on 7/27/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello, World!").font(.largeTitle).foregroundColor(Color.blue)
            Spacer()
            Image("koala").resizable().aspectRatio(contentMode: .fit).cornerRadius(20).padding(.all)
            Spacer()
            Text("Goodbye").font(.title)
            HStack{
                Text("First")
                Text("Second")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
