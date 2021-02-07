//
//  SocketManager.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/1/21.
//

import Foundation
import Starscream

class SocketManager: NSObject, WebSocketDelegate {

    private var socket: WebSocket?
    private let delegate: SocketManagerDelegate?
    private var connected = false
    
    init(delegate: SocketManagerDelegate?) {
        self.delegate = delegate
    }
    
    func connect(address: String = "ws://sim.smogon.com/showdown/websocket") {
        let request = URLRequest(url: URL(string: address)!)
        socket = WebSocket(request: request)
        socket!.delegate = self
        socket!.connect()
    }
    
    func send(text: String) {
        socket?.write(string: text)
    }
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        print(event)
        
        switch event {
        case .connected(let headers):
            print("websocket is connected: \(headers)")
            connected = true
            break
        case .disconnected(let reason, let code):
            print("websocket is disconnected: \(reason) with code: \(code)")
            connected = false
            break
        case .text(let string):
            print("Received text: \(string)")
            delegate?.receivedText(text: string)
            break
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

protocol SocketManagerDelegate {
    func receivedText(text: String) -> Void
}
