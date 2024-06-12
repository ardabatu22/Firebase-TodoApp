//
//  Extensions.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 12.04.2024.
//

import Foundation
//Extension yapısı Swift'te kodumuzda varolan sınıflara, protokollere veya yapılara yeni işlevler eklememizi sağlar
extension Encodable{
    func asDictionary() -> [String:Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
            
        }catch{
            return[:]
        }
    }
}
