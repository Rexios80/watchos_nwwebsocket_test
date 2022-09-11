//
//  Websocket_TestApp.swift
//  Websocket Test WatchKit Extension
//
//  Created by Rexios on 9/10/22.
//

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

class SocketClient {}
