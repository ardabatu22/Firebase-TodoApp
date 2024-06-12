//
//  ToDoListView.swift
//  firebaseprojedenemee
//
//  Created by Batuhan Arda on 4.04.2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem] // @FirestoreQuery özelliği, belirtilen koleksiyon yolundan gerçek zamanlı olarak veri çeker ve bu verileri items adlı değişkende depolar.
    
    init(userId: String) {
        // FirestoreQuery'yi başlatır, belirli bir kullanıcı ID'sine göre "users/{userId}/todos" yolundan veri çeker
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        // ToDoListViewModel'i başlatır ve StateObject olarak sarar
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }

    var body: some View {
        NavigationStack{
            VStack{
                List(items) { item in
                    ToDoListItemView(item:item)
                        .swipeActions{
                            Button("Sil"){
                                viewModel.delete(id:item.id)
                            }.background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Görevler")
            .toolbar{ // yukarıda sağ üst köşede 
                Button{
                    viewModel.showinNewItemView = true
                }label:{
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showinNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showinNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "IIlOIQehxQd4ZmUVNIVqSHxFGaW2")
}
