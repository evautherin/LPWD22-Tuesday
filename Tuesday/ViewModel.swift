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
    
    var listener: ListenerRegistration?
    var subscription: AnyCancellable?
    
    init() {
        subscription = $user.sink(receiveValue: { [weak self] user in
            self?.setListener(user: user)
        })
    }
}


// Firebase management
extension ViewModel {
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
    
    func snapshotListener(querySnapshot: QuerySnapshot?, error: Error?) {
        if let error = error {
            errorMessage = error.localizedDescription
        }
        
        if let documents = querySnapshot?.documents {
            print("Documents: \(documents)")
            documents.forEach({ document in
                do {
                    let item = try document.data(as: Item.self)
                    errorMessage = .none
                    if let name = item?.name {
                        print("Item name: \(name)")
                    }
                } catch {
                    errorMessage = error.localizedDescription
                }
                
            })
        }
    }
    
    func setListener(user: User?) {
        if let existingListener = listener {
            existingListener.remove()
            print("Existing listener removed")
            listener = .none
        }

        if let user = user {
            let collection = Firestore.firestore().collection("FirstCollection")
            listener = collection.addSnapshotListener { [weak self] (querySnapshot, error) in
                self?.snapshotListener(querySnapshot: querySnapshot, error: error)
            }
            print("Listener added for \(user.uid)")
        }
    }
}
