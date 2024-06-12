//
//  HeaderView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 9.04.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Text("alpha")
                .font(.system(size:50))
                .fontWeight(.bold)
                .padding(.top, 30)
        }.padding(.top, 100)
    }
}

#Preview {
    HeaderView()
}
