//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModle()
    
    var body: some View {
        NavigationView {
            VStack {
                // header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, backgroundcolor: .pink)
                .offset(y:-100)
            
                
                // login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                         .textFieldStyle(DefaultTextFieldStyle())
                        
                    TLButton(text: "Log In", backgroundcolor: .blue) {
                        viewModel.login()
                    }
                }
                .scrollContentBackground(.hidden)
                .offset(y:-15)
                
                // create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 100)
                
                
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
        }
        
    }
}

#Preview {
    LoginView()
}
