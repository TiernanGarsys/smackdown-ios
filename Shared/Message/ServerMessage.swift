//
//  ServerMessage.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/17/21.
//

import Foundation

// A single message of the PokemonShowdown server-to-client protocol as
// documented at: 
//   Server Lifecycle: https://github.com/smogon/pokemon-showdown/blob/master/PROTOCOL.md
//   Battle Lifecycle: https://github.com/smogon/pokemon-showdown/blob/master/SIM-PROTOCOL.md
struct ServerMessage {
    let type: ServerMessageType
    let roomID: RoomID?
    let payload: Payload
}

enum ServerMessageType {
    case activeUsers
    case battleFormats
    case battleStart
    case challengeUpdate
    case html
    case loginChallenge
    case nameChangeFailed
    case notifyAll
    case notifySome
    case popup
    case privateMessage
    case queryResponse 
    case roomJoined
    case roomTitle
    case searchUpdate
    case systemMessage
    case timestamp
    case timestampMessage
    case uhtml
    case uhtmlChanged
    case userCount
    case userJoin
    case userLeave
    case userMessage
    case userNameChange
    case userUpdated
    // TODO(tiernan): Add tournament message types 
}

typealias RoomID = String

protocol Payload {}

