//
//  ContentView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn,
           !viewModel.currentUserId.isEmpty{
           accountView  
        }else {
            LoginView()
        }
        
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId:viewModel.currentUserId) // bu id yolluyoruz çünkü diğer sayfada hangi kullanıcını idsi ne göre listeleme yapması için
                .tabItem {
                    Label("Görevler",systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profil",systemImage: "person.circle")
                }
        }
    }
}
#Preview {
    MainView()
}
