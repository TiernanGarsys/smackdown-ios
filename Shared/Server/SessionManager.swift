//
//  MessageBridge.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/3/21.
//

import Foundation

class SessionManager: ObservableObject {
    
    @Published var loggedIn: Bool = false
    
    private let socketManager: SocketManager
    
    init() {
        socketManager = SocketManager()
        self.socketManager.connect()
    }
}
