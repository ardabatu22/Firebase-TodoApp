//
//  NewItemView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//

import SwiftUI

struct NewItemView: View {
    @Binding var newItemPresented:Bool // saveden sonra değeri false yaptıktan sonra todolisteeki değişkeninde false dönmesi gerekiyor 
    @StateObject var viewModel = NextItemViewModel()
    
    var body: some View {
        VStack{
            Text("Yeni Görev")
                .font(.title)
                .bold()
                .padding(.top , 100)
            Form{
                TextField("Başlık", text: $viewModel.title)
                DatePicker("Bitiş Tarihi", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BigButtonView(title: "Kaydet"){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                }
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Hata"),message: Text("Verilerin doğruluğunu kontrol edin."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
     return true
        
    }, set: { _ in
    }))
}
