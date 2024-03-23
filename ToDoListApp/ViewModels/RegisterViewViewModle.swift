//
//  RegisterViewViewModle.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class RegisterViewViewModle: ObservableObject {
    @Published var name=""
    @Published var email=""
    @Published var password=""
    @Published var rePassword=""
    @Published var errorMessage=""
    
    init() {}
    
    // register a new user
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    // add user into database
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    // validate inputs
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !rePassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter correct email address"
            return false
        }
        
        guard password==rePassword else {
            errorMessage = "Please make sure passwords are same"
            return false
        }
       
        guard password.count >= 6 else {
            errorMessage = "Please choose password that is longer or equal to 6 character"
            return false
        }
        return true
    }
}
