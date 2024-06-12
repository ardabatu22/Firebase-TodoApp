//
//  ToDoListViewModel.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//
import FirebaseFirestore
import Foundation

class ToDoListViewModel:ObservableObject{
    @Published var showinNewItemView = false
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    // Delete todo list item
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
