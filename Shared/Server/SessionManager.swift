//
//  MessageBridge.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/3/21.
//

import Foundation

class SessionManager: ObservableObject, SocketManagerDelegate {

    @Published var loggedIn: Bool = false
    @Published var receivedMessages: [String] = []
    
    private var socketManager: SocketManager?

    
    init() {
        socketManager = SocketManager(delegate: self)
        self.socketManager!.connect()
    }
    
    func receivedText(text: String) {
        receivedMessages.append(text)
    }
}
