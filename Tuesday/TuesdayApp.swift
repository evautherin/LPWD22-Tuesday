//
//  TuesdayApp.swift
//  Tuesday
//
//  Created by Etienne Vautherin on 08/02/2022.
//

import SwiftUI
import Firebase

@main
struct TuesdayApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
