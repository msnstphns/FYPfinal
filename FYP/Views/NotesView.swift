//
//  NotesView.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//  reference to original code that has been modified/adapted https://peterfriese.github.io/MakeItSo/tutorials/makeitso/01-building-a-simple-todo-list-ui/

import SwiftUI

// variables for task
struct TaskItem: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct NotesView: View {
    // variable to hold the list of tasks
    @State private var taskItems: [TaskItem] = []
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // field to input new task/note
                TextField("Add a new task/note", text: $newTaskTitle)
                    .padding()
                    .font(.title3)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                // button to add new task
                Button(action: {
                    addTaskItem()
                }) {
                    Text("Add note")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                .padding(.top, 10)
                
                // list here in a loop to display tasks
                List {
                    ForEach(taskItems) { taskItem in
                        HStack {
                            Image(systemName: taskItem.isCompleted ? "checkmark.square.fill" : "square")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(taskItem.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    toggleTaskCompletion(taskItem)
                                }
                            
                            Text(taskItem.title)
                                .font(.body)
                                .foregroundColor(taskItem.isCompleted ? .gray : .primary)
                        }
                    }
                    .onDelete(perform: deleteTaskItem)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Notes")
                .toolbar {
                    EditButton()
                }
            }
            .padding()
            .background(Color(.systemGroupedBackground))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // function add a new task
    func addTaskItem() {
        if !newTaskTitle.isEmpty {
            let newTaskItem = TaskItem(title: newTaskTitle)
            taskItems.append(newTaskItem)
            newTaskTitle = ""
        }
    }
    
    // function toggle task completion
    func toggleTaskCompletion(_ taskItem: TaskItem) {
        if let index = taskItems.firstIndex(where: { $0.id == taskItem.id }) {
            taskItems[index].isCompleted.toggle()
        }
    }
    
    // function delete a task
    func deleteTaskItem(at offsets: IndexSet) {
        taskItems.remove(atOffsets: offsets)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
