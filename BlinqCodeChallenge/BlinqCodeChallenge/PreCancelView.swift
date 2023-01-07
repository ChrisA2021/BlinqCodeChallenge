//
//  PreCancelView.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 7/1/2023.
//

import SwiftUI

struct PreCancelView: View {
    
    @State private var showAlert = false
    @Binding var hasRegisteredSuccessfully: Bool
    @State private var showSuccessfulCancel = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("Broccoli & Co.")
                    .font(.title).padding(20)
                Text("Please click below\nIf you would like to cancel your invite\n")
                    .multilineTextAlignment(.center)
                Button("Cancel your invite") {
                    showAlert = true
                }.alert("Are you sure you would like to cancel your invite?",isPresented: $showAlert) {
                    Button("No, I changed my mind", role:.cancel) {
                    }
                    Button("Yes") {
                        showSuccessfulCancel = true
                    }
                }
            }
            .sheet(isPresented: $showSuccessfulCancel) {
                NavigationView {
                    SuccessfulCancelView()
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    showSuccessfulCancel = false
                                    hasRegisteredSuccessfully = false
                                }
                            }                        }
                }
            }
        }
    }
}


struct PreCancelView_Previews: PreviewProvider {
    static var previews: some View {
        PreCancelView(hasRegisteredSuccessfully: .constant(false))
    }
}


