//
//  CircleImage.swift
//  Lesson1-SwiftUI
//
//  Created by Artsiom Sakratar on 2/14/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("logo").clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 4)).shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
