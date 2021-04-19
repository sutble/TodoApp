//
//  TaskRepository.swift
//  TodoApp
//
//  Created by Adi on 6/29/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init(){
        loadData()
    }
    
    func loadData() {
        db.collection("tasks").addSnapshotListener { (querySnapshot,error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap{document in
                    try? document.data(as: Task.self)
                }
            }
            
        }
        
    }
}
