//
//  SocketManager.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/1/21.
//

import Foundation
import Starscream

class SocketManager: NSObject, WebSocketDelegate {

    private var socketUrl: URL
    private var socket: WebSocket?
    
    @Published var connected = false
    
    init(address: String = "ws://sim.smogon.com/showdown/websocket") {
        socketUrl = URL(string: address)!
    }
    
    func connect() {
        let request = URLRequest(url: socketUrl)
        socket = WebSocket(request: request)
        socket!.delegate = self
        socket!.connect()
    }
    
    func send(inputText: String) {
        socket?.write(string: inputText)
        print("WROTE: \(inputText)")
    }
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        print(event)
        
        switch event {
        case .connected(let headers):
            print("websocket is connected: \(headers)")
            connected = true
        case .disconnected(let reason, let code):
            print("websocket is disconnected: \(reason) with code: \(code)")
            connected = false
        case .text(let string):
            print("Received text: \(string)")
        case .binary(let data):
            print("Received data: \(data.count)")
        case .ping(_):
            print("Received ping")
            break
        case .pong(_):
            print("Received pong")
            break
        case .viabilityChanged(_):
            print("Received viabilityChanged")
            break
        case .reconnectSuggested(_):
            print("Received reconnectSuggested")
            break
        case .cancelled:
            connected = false
            print("Received cancelled")
        case .error(let error):
            print("Received error: \(error.debugDescription)")
            connected = false
            break
        }
    }
}
