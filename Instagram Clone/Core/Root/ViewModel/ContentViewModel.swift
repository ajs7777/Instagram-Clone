//
//  ContentViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 13/01/25.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession : FirebaseAuth.User?
    
    init() {
        
    }
    
    func setUpSubscribers() {
        service.$userSession.sink { userSession in
            self.userSession = userSession
        } .store(in: &cancellables)
    }
}
