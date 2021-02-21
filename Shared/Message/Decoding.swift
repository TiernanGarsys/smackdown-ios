//
//  Decoding.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/20/21.
//

import Foundation

func DecodeMessage(messageText: String) -> [ServerMessage] {
    let trimmedText = messageText.trim()

    if trimmedText.count == 0 {
        print("DecodeMessage: received empty string for messageText")
    }

    var lines = trimmedText.split(whereSeparator: \.isNewline)
    lines = lines.map { $0.trim() }

    var roomID = nil
    if lines[0].hasPrefix(">")) {
        // The first line indicates the RoomID for all messages in the payload
        roomID =  
    }
}
