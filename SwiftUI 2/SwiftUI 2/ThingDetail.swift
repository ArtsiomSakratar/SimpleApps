//
//  ThingDetail.swift
//  SwiftUI 2
//
//  Created by Artsiom Sakratar on 7/27/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import SwiftUI

struct ThingDetail: View {
    
    let thing: Thing
    
    var body: some View {
        VStack {
            Image(thing.imageURL).resizable().aspectRatio(contentMode: .fit).cornerRadius(16).padding()
            Text(thing.name)
            Text(thing.description)
        }
        .navigationBarTitle(Text(thing.name), displayMode: .inline)
    }
}

struct ThingDetail_Previews: PreviewProvider {
    static var previews: some View {
        ThingDetail(thing: Thing(name: "Koala", description: "Favorite Animal", imageURL: "koala"))
    }
}
