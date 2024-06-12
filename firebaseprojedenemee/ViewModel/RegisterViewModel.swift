//
//  RegisterViewModel.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel:ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    func register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result,error in
            // [weak self] yapmamızdaki olay sayfanın bağlılığını azaltmak ve view modeli deinit() yaptığımızda memoryden silinmesini sağlar.
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId) // insertUserRecord fonksiyonu, Firebase Firestore gibi bir veritabanına kullanıcı bilgilerini eklemekle sorumludur. userId parametresi, oluşturulan kullanıcının kimliğini temsil eder ve bu kimlik, kullanıcının Firebase ortamındaki benzersiz kimliğidir.
            
        }
    }
    
    private func insertUserRecord(id:String){
        // firestoreda adını soyadınıı doğum tarihi vb gibi şeyleri saklamak için kullanıyoruz bu fonksiyonu   
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) // extension yaptık
    }
    
    private func validate () -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty, //
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Tüm alanları doldurunuz"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir e-mail adresi girin."
            return false
            
        }
        guard password.count >= 6 else {
            errorMessage = "Lütfen 6 veya daha fazla karakterli bir şifre belirleyiniz."
            return false
        }
        return true
    }
    
    
}
