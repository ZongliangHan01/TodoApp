//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModle()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width:125, height:125)
            .padding(.bottom, 30)
            .padding(.top, 80)
        
        //info: name, email
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            .padding(.bottom, 10)
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            .padding(.bottom, 10)
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.bottom, 10)
        }
        .padding(.bottom, 30)
    
        //sign out
        Button {
            viewModel.signOut()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 130, height: 50)
                    .foregroundColor(.red)
                Text("Log Out")
                    .foregroundColor(.white)
            }
            
            
        }
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
