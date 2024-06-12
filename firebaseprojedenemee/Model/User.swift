//
//  User.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import Foundation

struct User: Codable{ // codable json dosyasından modele çevirmek için
    let id:String
    let name:String
    let email:String
    let joined: TimeInterval
}
