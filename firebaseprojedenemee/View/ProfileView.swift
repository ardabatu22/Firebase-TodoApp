//
//  ProfileView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    init(){}
    var body: some View {
        NavigationStack{
            VStack{
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width:125,height: 125)
                    VStack{
                        HStack{
                            Text("İsim:")
                            Text(user.name)
                        }
                        HStack{
                            Text("Email:")
                            Text(user.email)
                        }
                        HStack{
                            Text("Kayıt Tarihi:")
                            Text("\(Date(timeIntervalSince1970:user.joined).formatted(date:.abbreviated,time:.shortened))")
                        }
                    }
                }else {
                    Text("Profil yükleniyor...")
                    
                }
                
                BigButtonView(title:"çıkış yap"){
                    viewModel.logout()
                }
                
            }
            .navigationTitle("Profil")
        }
        .onAppear(){
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
