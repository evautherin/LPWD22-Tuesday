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


class ViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
}
