//
//  Websocket_TestApp.swift
//  Websocket Test WatchKit Extension
//
//  Created by Rexios on 9/10/22.
//

import Network
import NWWebSocket
import SwiftUI

@main
struct Websocket_TestApp: App {
    let client = SocketClient()
    
    var body: some Scene {
        WindowGroup {
            Text("Websocket Running")
        }
    }
}

class SocketClient: WebSocketConnectionDelegate {
    init() {
        let socket = NWWebSocket(url: URL(string: "ws://localhost:3476")!)
        socket.delegate = self
        socket.connect()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            socket.send(string: "Echo!")
        }
    }

    func webSocketDidConnect(connection: WebSocketConnection) {
        print("Connected")
    }
    
    func webSocketDidDisconnect(connection: WebSocketConnection, closeCode: NWProtocolWebSocket.CloseCode, reason: Data?) {}
    
    func webSocketViabilityDidChange(connection: WebSocketConnection, isViable: Bool) {}
    
    func webSocketDidAttemptBetterPathMigration(result: Result<WebSocketConnection, NWError>) {}
    
    func webSocketDidReceiveError(connection: WebSocketConnection, error: NWError) {}
    
    func webSocketDidReceivePong(connection: WebSocketConnection) {}
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, string: String) {
        print(string)
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, data: Data) {}
}
