//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var registerModel = RegisterViewViewModle()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start Organizing Todos", angle: -15, backgroundcolor: .yellow)
                .offset(y:-150)
            
            Form {
                TextField("Full Name", text: $registerModel.name)
                    .autocorrectionDisabled()
                TextField("Eamil Address", text: $registerModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $registerModel.password)
                SecureField("Re-Enter Password", text: $registerModel.rePassword)
                
                TLButton(text: "Create Account", backgroundcolor: .green) {
                    registerModel.register()
                }
            }
            .offset(y:-80)
            
            Spacer()
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    RegisterView()
}
