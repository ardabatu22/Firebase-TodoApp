//
//  MainViewModel.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import Foundation
import FirebaseAuth
class MainViewViewModel:ObservableObject{
    @Published var currentUserId: String = ""
    
    init(){
        Auth.auth().addStateDidChangeListener{ [weak self] _, user in // firebasede login olunmuş mu olunmamış mı burada kontrol ediyoruz
            // _ nın anlamı burada 2 parametre dönüyor 1. parametreyi _ bu sembol "bu parametreyi dikkate almayacağım" anlamına gelir.
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
