//
//  Thing.swift
//  SwiftUI 2
//
//  Created by Artsiom Sakratar on 7/27/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation
import SwiftUI

struct Thing: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageURL: String
}
