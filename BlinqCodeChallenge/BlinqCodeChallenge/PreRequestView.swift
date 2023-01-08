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
            Image("Broccoli Background")
                .resizable()
                .accessibilityLabel("Broccoli Background")
            VStack{
                Text("Broccoli & Co.")
                    .background(.white)
                    .font(.title).fontWeight(.bold).padding(20)
                Text("Please click below to get an invite\n").background(.white)
                Button(action: {showRequestForm.toggle()}, label: {Text("Request an Invite")}).background(.white)
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

