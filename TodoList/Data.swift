//
//  Data.swift
//  TodoList
//
//  Created by Matt Wilkes on 29/08/2024.
//

import Foundation
import SwiftUI

struct ToDoItem: Identifiable {
    let id = UUID()
    var text: String
    var done: Bool
}


