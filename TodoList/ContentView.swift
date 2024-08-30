//
//  ContentView.swift
//  TodoList
//
//  Created by Matt Wilkes on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
//body is the only mandatory element for swift UI app
    @State var toDotext = ""
    @State var toDoItems = [ToDoItem]()
    @State var done = false
    var body: some View {
//        VStack=Vertical, HStack=Horizontal, ZStack=In-depth (on top of each other)
//        Recommended to put everything in a VStack for each view
//        check LazyVStack out
//        check TabView {} adds tabs at the bottom, renders tab items, use HomeView()
//        use struct HomeView
//        padding can .padding([.top, .leading],100) instead of chaining
//        Use ScrollView to make everything inside a scroll view
        
        VStack {
            VStack {
                    Image("todo_list_2")
                    .resizable()
//                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
//                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea()
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            NavigationView {
                    VStack {
                        List {
                            Section(header: Text("Add an item")) {
                                HStack {
                                    TextField("Enter some text", text: $toDotext)
                                    Button {
                                        guard !toDotext.isEmpty else { return }
                                        toDoItems.append(ToDoItem(text: toDotext, done: false))
                                        toDotext = ""
                                    }
//                                    .fontWeight(.bold)
//                                    .foregroundStyle(.green)
//                                    .buttonStyle(.automatic)
                                label: {
//                                    Image(systemName: "plus")
                                    Text("Add")
                                        .fontWeight(.bold)
                                        .foregroundStyle(.mint)
                                        .accessibilityLabel("Add Item")
                                        .accessibilityHint("Adds an item to the list")
                                }
                                }
                            }
        
                            Section {
                                ForEach($toDoItems) { $item in
                                    Toggle(isOn: $item.done) {
                                        NavigationLink(destination: ToDoItemDisplayView(toDoItemText: item.text)) {
                                            Text(item.text)
                                                .fontWeight(.bold)
                                                .swipeActions(edge: .trailing) {
                                                    Button("Edit") {
                                                        //ToDo
                                                    }
                                                }
                                        }
                                    }
                                    .tint(.teal)
                                    .accessibilityLabel("Toggle Done")
                                    .accessibilityHint("Toggle complete on or off")
                                }
                                
                            }
                            
                        }
                        .navigationBarTitle("To Do List")
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
