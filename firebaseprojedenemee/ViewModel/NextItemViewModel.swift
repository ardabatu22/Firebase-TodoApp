//
//  NextItemViewModel.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NextItemViewModel:ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false 
    init(){}
    
    func save (){
        guard canSave else {
            return
        }
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        let newItemId = UUID().uuidString
        let newItem = ToDoListItem(id: newItemId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newItemId)
            .setData(newItem.asDictionary())
    }
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        //-86400 bir güne eşittir. Burada 86400 değeri bir günün saniye cinsinden değeridir. Örneğin 10:52 kısmında canSave metodu içerisinde dueDate'i ele alıyor olalım. Burada yaptığımız kontrol bitiş tarihi bugünden geçmişte bir tarihte olamaz demek. Date() kısmı ile tarihi alıyoruz ve addingTimeInterval(-86400) ile düne gitmiş oluyoruz. Bu sayede guard ile bir condition ( durum ) ifadesi yazmış oluyoruz.
        return true
    }
}

