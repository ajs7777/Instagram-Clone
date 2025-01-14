//
//  ContentViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 13/01/25.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    
    init() {
        setUpSubscribers()
    }
    
    func setUpSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        } .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        } .store(in: &cancellables)
    }
}
