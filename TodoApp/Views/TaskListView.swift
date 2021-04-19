//
//  ContentView.swift
//  TodoApp
//
//  Created by Adi on 6/29/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var presentNewItem = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List{
                    ForEach(taskListVM.taskCellViewModels){  taskCellVM in
                        TaskCell(taskCellViewModel:taskCellVM)
                    }
                    if presentNewItem {
                        TaskCell(taskCellViewModel: TaskCellViewModel(task: Task(title: "", completed: false))){task in
                            self.taskListVM.addTask(task:task)
                            self.presentNewItem.toggle()
                            
                        }
                    }
                }
                
                Button(action: {self.presentNewItem.toggle()}){
                    HStack{
                        Image(systemName: "plus.circle.fill").resizable().frame(width:20,height:20)
                        Text("Add New Task")
                    }
                }.padding()
            }.navigationBarTitle(Text("Tasks"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}


struct TaskCell: View{
    @ObservedObject var taskCellViewModel: TaskCellViewModel
    var onCommit: (Task) -> (Void) = { _ in }
    var body: some View{
        HStack{
            Image(systemName: taskCellViewModel.completionStateIconName)
                .resizable()
                .frame(width:20,height:20)
                .onTapGesture {
                    self.taskCellViewModel.task.completed.toggle()
            }
            TextField("Enter new Task here",text: $taskCellViewModel.task.title, onCommit: {
                self.onCommit(self.taskCellViewModel.task)
            })
        }
    }
}
