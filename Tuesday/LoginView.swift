//
//  LoginView.swift
//  Tuesday
//
//  Created by Etienne Vautherin on 08/02/2022.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var mail = ""
    @State var password = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Email")
            TextField("Email", text: $mail)
                .textFieldStyle(.roundedBorder)
            Text("Password")
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

















extension LoginView {
//    func f() {
//        Task {
//            do {
//                let authResult = try await  Auth.auth().signIn(withEmail: "", password: "")
//                user = authResult.user
//            } catch {
//                errorMessage = error.localizedDescription
//            }
//        }
//    }
    
//    SecureField("Mail:", text: $mail)
//        .textFieldStyle(.roundedBorder)
//        .padding()
}
