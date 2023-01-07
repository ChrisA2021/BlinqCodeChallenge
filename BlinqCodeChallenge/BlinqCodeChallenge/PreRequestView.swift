//
//  PreRequestView.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 2/1/2023.
//

import SwiftUI

struct PreRequestView: View {
    
    @State private var showRequestForm = false
    @Binding var hasRegisteredSuccessfully: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Text("Broccoli & Co.")
                    .font(.title).padding(20)
                Text("Please click below to get an invite")
                Button(action: {showRequestForm.toggle()}, label: {Text("Request an Invite")})
            }
            .sheet(isPresented: $showRequestForm) {
                NavigationView {
                    RequestFormView(showRequestForm: $showRequestForm, hasRegisteredSuccessfully: $hasRegisteredSuccessfully)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    showRequestForm = false
                                }
                            }                        }
                }
            }
        }
    }
}


struct PreRequestView_Previews: PreviewProvider {
    static var previews: some View {
        PreRequestView(hasRegisteredSuccessfully: .constant(false))
    }
}

