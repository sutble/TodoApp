//
//  TaskListViewModel.swift
//  TodoApp
//
//  Created by Adi on 6/29/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import Foundation
import Combine


class TaskListViewModel:ObservableObject{
    @Published var taskRepository = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        taskRepository.$tasks.map{tasks in
            tasks.map { task in
                TaskCellViewModel(task:task)
            }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func addTask(task:Task){
        let taskCellVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskCellVM)
    }
    
}
