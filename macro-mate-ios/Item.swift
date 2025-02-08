//
//  Item.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
