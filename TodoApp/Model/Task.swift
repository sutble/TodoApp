//
//  Task.swift
//  TodoApp
//
//  Created by Adi on 6/29/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
}

let testDataTasks = [
     Task(title: "Summon the courage to start", completed: true),
    Task(title: "Figure out this MVVM BS", completed: false),
    Task(title: "Figure out how to integrate Firebase into this thing", completed: false),
    Task(title: "Start torrenting some seasons, its only a couple gb?", completed: false),
    Task(title: "Test out the workflow for screenshotting and uploading to the app", completed: false)]
