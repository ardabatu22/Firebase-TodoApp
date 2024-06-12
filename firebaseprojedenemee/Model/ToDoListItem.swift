//
//  ToDoListItem.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import Foundation

struct ToDoListItem: Codable , Identifiable{
    let id : String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone:Bool // todolist üzerinde ki listedeki görevelere checkmark eklemek için
    
    mutating func setDone(_ state:Bool){
        isDone = state 
    }
    
}
