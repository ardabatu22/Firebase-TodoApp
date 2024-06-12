//
//  RegisterView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationStack{
            
            VStack {
                 HeaderView()
                Form{
                   
                    Section(header:Text("Kayıt Formu")){
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Tam Adınız:",text: $viewModel.name)
                            .autocorrectionDisabled() // Otomatik tamamlama kapatma
                        TextField("Email şifreniz",text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none) // baş harfleri büyütmeyi kapatıyoruz    
                        SecureField("Şifreniz",text:$viewModel.password)
                        
                    }
                    
                }
                .frame(height:250)
                BigButtonView(title: "Kayıt Ol", action: {viewModel.register()})
                Spacer()
                
              
            }
        }
    }
}

#Preview {
    RegisterView()
}
