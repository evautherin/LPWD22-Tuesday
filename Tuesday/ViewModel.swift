//
//  ViewModel.swift
//  Tuesday
//
//  Created by Etienne Vautherin on 08/02/2022.
//

import Foundation
import Combine
import SwiftUI
import FirebaseAuth


@MainActor
class ViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    
    func login(mail: String, password: String) {
        Task {
            do {
                let authResult = try await Auth.auth().signIn(withEmail: mail, password: password)
                errorMessage = .none
                user = authResult.user
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
