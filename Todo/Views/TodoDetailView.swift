//
//  TodoDetailView.swift
//  Todo
//
//  Created by Vinh Nguyen on 2019/09/27.
//  Copyright © 2019 GCS. All rights reserved.
//

import SwiftUI

struct TodoDetailView: View {
    @ObservedObject var session = FirebaseSession()
    @State var complete = false
    
    var todo: TODOS
    
    var body: some View {
        HStack {
            Text(todo.todo)
            Spacer()
            VStack {
                Text("Is completed")
                Button(action: {
                    self.buttonPressed()
                }) {
                    if self.complete == true {
                        Image(systemName: "checkmark").imageScale(.medium)
                    } else {
                        Image(systemName: "xmark").imageScale(.medium)
                    }
                }
                .onAppear() {
                    self.setupButton()
                }
            }
        }
    }
    
    func setupButton() {
        if todo.isComplete == "true" {
            complete = true
        } else {
            complete = false
        }
    }
    
    func buttonPressed() {
        if complete == true {
            self.complete = false
            self.session.updateTODO(key: todo.key, todo: todo.todo, isComplete: "false")
            print("buttonpressed ran, should set complete, complete is: \(String(describing: self.complete))")
        } else {
            self.complete = true
            self.session.updateTODO(key: todo.key, todo: todo.todo, isComplete: "true")
            print("buttonpressed ran, should set incomplete, complete is \(String(describing: self.complete))")
        }
    }
}
