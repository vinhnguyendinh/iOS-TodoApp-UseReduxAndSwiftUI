//
//  TodoView.swift
//  Todo
//
//  Created by Vinh Nguyen on 2019/09/27.
//  Copyright © 2019 GCS. All rights reserved.
//

import SwiftUI

struct TodoView: View {
    var todo: TODOS
    
    var body: some View {
        HStack {
            Text(todo.todo)
            
            Spacer()
            
            if todo.isComplete == "true" {
                Image(systemName: "checkmark").imageScale(.medium)
            } else {
                Image(systemName: "xmark").imageScale(.medium)
            }
        }
    }
}
