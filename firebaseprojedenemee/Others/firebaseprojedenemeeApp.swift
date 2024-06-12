//
//  firebaseprojedenemeeApp.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//
import FirebaseCore
import SwiftUI

@main
struct firebaseprojedenemeeApp: App {
    init(){//init her şeyden önce bunları yap sonra geç demek
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
