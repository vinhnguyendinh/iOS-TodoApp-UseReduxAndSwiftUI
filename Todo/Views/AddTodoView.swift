//
//  AddTodoView.swift
//  Todo
//
//  Created by Vinh Nguyen on 2019/09/27.
//  Copyright © 2019 GCS. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    @State private var newTODO = ""
    
    @ObservedObject var session = FirebaseSession()
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("TODO:")
                    TextField("Enter TODO", text: $newTODO)
                        .padding()
                }
                Button(action: {
                    self.addTODO()
                }) {
                    Text("Add")
                }
            }
        }
        .padding()
    }
    
    func addTODO() {
        if !newTODO.isEmpty {
            //Add TODO to Firebase
            session.uploadTODO(todo: newTODO)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
