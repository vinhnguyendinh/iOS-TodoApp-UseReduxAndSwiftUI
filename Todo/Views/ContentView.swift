//
//  ContentView.swift
//  Todo
//
//  Created by Vinh Nguyen on 2019/09/27.
//  Copyright © 2019 GCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var session = FirebaseSession()
    
    var body: some View {
        NavigationView {
            Group {
                if self.session.session != nil {
                    VStack {
                        NavigationLink(destination: AddTodoView()) {
                            Text("Add Todo")
                        }.padding()
                        
                        List {
                            ForEach(self.session.items) { todo in
                                NavigationLink(destination: TodoDetailView(todo: todo)) {
                                    TodoView(todo: todo)
                                }
                            }
                        }
                        .navigationBarItems(trailing: Button(action: {
                            self.session.logOut()
                        }) {
                            Text("Logout")
                        })
                    }
                } else {
                    LoginView()
                        .navigationBarItems(trailing: Text(""))
                }
            }
            .onAppear(perform: getUser)
            .navigationBarTitle(Text("TODO"))
            .padding()
        }
    }
    
    func getUser() {
        self.session.listen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
