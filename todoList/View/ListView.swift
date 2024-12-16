//
//  ListView.swift
//  todoList
//
//  Created by Mac on 14/07/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    @State private var date = Date()
    

    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else
            {
                List(content: {
                    ForEach(listViewModel.items,content: {
                        items in HeadListRow(item: items)
                            .onTapGesture{
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: items)
                                }
                            }
                    })
                    .onDelete(perform:listViewModel.deleteItemFromList)
                    .onMove(perform: listViewModel.moveItemInList)
                   
                })
                .listStyle(PlainListStyle())
            }
           
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddListITem())
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            ListView()
        }).environmentObject(ListViewModel())
    }
}

