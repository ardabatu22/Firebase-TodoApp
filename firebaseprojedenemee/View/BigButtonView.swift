//
//  BigButtonView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 9.04.2024.
//

import SwiftUI

struct BigButtonView: View {
    let title: String
    let action : () -> Void
    var body: some View {
        Button(action: action , label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(title)
                    .foregroundStyle(.white)
            }
        })
        .frame(height:50)
        .padding(.horizontal)
    }
}

#Preview {
    BigButtonView(title: "String", action: {})
}
