//
//  AddListITem.swift
//  todoList
//
//  Created by Mac on 14/07/2024.
//

import SwiftUI

struct AddListITem: View {
    @State var text : String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    @Environment(\.presentationMode) var presentationModel
    @EnvironmentObject var listViewModel : ListViewModel
    @State private var birthDate = Date()
    
    var dateFormatter: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: birthDate)
       }
    var body: some View {
        ScrollView(content: {
            VStack(content: {
                TextField("Type something here....", text:$text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(15)
                
                    DatePicker(selection: $birthDate,
                               in: ...Date(),
                                displayedComponents: [.date, .hourAndMinute]

                    ) {
                        Text("Add Date Time")
                            .font(.system(size: 15,weight: .medium,design: .rounded))
                            
                    }
                    .datePickerStyle(.compact)
                    .environment(\.locale, .init(identifier: "en"))
                Button(
                   action:saveButtonPressed,
                   label:  {
                    Text("Save".uppercased())
                           .font(.headline)
                           .frame( height: 55)
                           .frame(maxWidth: .infinity)
                           .foregroundColor(Color.white)
                           .background(Color.accentColor)
                           .cornerRadius(15)
                }
            )
                .padding(.top , 20)
        })
            .padding(14)
    })
    
        .navigationTitle("Add Item 🖋")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsApprorpriate() {
            listViewModel.addItem(title: text,dateTime: dateFormatter)
            presentationModel.wrappedValue.dismiss()
        }
    }
    
    func textIsApprorpriate() -> Bool {
        if text.count < 3 {
            alertTitle = "Your new item must have at least 3 Character☺️"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddListITem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            AddListITem()
        })
        .environmentObject(ListViewModel())
    }
}
