//
//  LoginViewViewModel.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    func login (){
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    func validate() -> Bool {  // hata varsa false döndürduk hata yoksa true döndürüyoruz 
        // Hata mesajlarını üst üste bindirmemek için errorMessage'ı boşaltıyoruz.
        errorMessage = ""
        
        // İlk guard: Email ve password alanlarının boş olup olmadığını kontrol ediyoruz.
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            // Eğer email veya password boşsa, hata mesajını ayarlayıp false döndürüyoruz.
            errorMessage = "Tüm alanları doldurunuz"
            return false
        }
        
        // İkinci guard: Email'in geçerli bir formatta olup olmadığını kontrol ediyoruz.
        guard email.contains("@") && email.contains(".") else {
            // Eğer email geçerli bir formatta değilse, hata mesajını ayarlayıp false döndürüyoruz.
            errorMessage = "Lütfen geçerli bir e-mail adresi girin."
            return false
        }
        
        // Eğer tüm kontrollerden geçerse, true döndürüyoruz.
        return true
    }
}

