//
//  ContentView.swift
//  Tuesday
//
//  Created by Etienne Vautherin on 08/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ViewModel()

    var body: some View {
        VStack {
            if let user = model.user {
                Text("Hello, \(user.providerID)!")
                    .padding()
            } else {
                LoginView()
            }
            
            if let errorMessage = model.errorMessage {
                Text(errorMessage)
                    .padding()
            }
        }.environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
