//
//  LoginView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import SwiftUI

struct LoginView: View {
        @StateObject var viewModel = LoginViewViewModel() // State object bir sınıfın objesi haline getiriyoruz yani Loginviewviewmodel içerisinde publish ettik bunu
      
    var body: some View {
        NavigationStack{
            VStack{
               HeaderView()
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("E-mail Giriniz",text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Şifreniz",text:$viewModel.password)
                }.frame(height:200)
                BigButtonView(title: "Giriş Yap"){
                    viewModel.login()
                }
           
                Spacer()
                
                VStack{
                    Text("Hesabın yok mu ?")
                    NavigationLink("Yeni hesap oluştur",destination: RegisterView())
                }
                .padding(.bottom ,3)
            }
            
        }
    }
}

#Preview {
    LoginView()
}
