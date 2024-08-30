//
//  ToDoItemDisplayView.swift
//  TodoList
//
//  Created by Matt Wilkes on 29/08/2024.
//

import Foundation

import SwiftUI

struct ToDoItemDisplayView: View {
    var toDoItemText: String
    
    var body: some View {
        Text("\(toDoItemText)")
        .navigationTitle("To Do Item")
    }
}
