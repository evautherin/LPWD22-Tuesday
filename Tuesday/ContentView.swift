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
        if let user = model.user {
            Text("Hello, \(user.providerID)!")
                .padding()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
