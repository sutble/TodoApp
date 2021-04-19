//
//  TaskCellViewModel.swift
//  TodoApp
//
//  Created by Adi on 6/29/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import Foundation
import Combine


class TaskCellViewModel: ObservableObject, Identifiable {
    var id : String = ""
    @Published var task: Task
    @Published var completionStateIconName = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(task:Task){
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
        }
        .assign(to: \.completionStateIconName, on: self)
        .store(in: &cancellables)
        
        $task
            .compactMap { task in
                task.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
 
