//
//  BlinqCodeChallengeApp.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 2/1/2023.
//

import SwiftUI

@main
struct BlinqCodeChallengeApp: App {
    @State private var hasRegisteredSuccessfully = false
    
    var body: some Scene {
        WindowGroup {
            if (!hasRegisteredSuccessfully) {
                PreRequestView(hasRegisteredSuccessfully: $hasRegisteredSuccessfully)
            }
            else {
                PreCancelView(hasRegisteredSuccessfully: $hasRegisteredSuccessfully)
            }
        }
    }
}
