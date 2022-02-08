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
import FirebaseFirestore
import FirebaseFirestoreSwift

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
    
    func logout() {
        do {
            try Auth.auth().signOut()
            errorMessage = .none
            user = .none
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func getDocuments() {
        let collection = Firestore.firestore().collection("FirstCollection")
        collection.addSnapshotListener { [weak self] (querySnapshot, error) in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            }
            
            if let documents = querySnapshot?.documents {
                print("Documents: \(documents)")
                documents.forEach({ document in
                    do {
                        let item = try document.data(as: Item.self)
                        self?.errorMessage = .none
                        if let name = item?.name {
                            print("Item name: \(name)")
                        }
                    } catch {
                        self?.errorMessage = error.localizedDescription
                    }
                    
                })
            }
        }
    }
}
