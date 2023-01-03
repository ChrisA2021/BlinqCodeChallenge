//
//  PreRequestView.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 2/1/2023.
//

import SwiftUI

struct PreRequestView: View {
    
    @State var showSheet: Bool = false
    @State private var fullName = ""
    @State private var email = ""
    @State private var confirmEmail = ""
    @State private var formValid: Bool = false

    
    var body: some View {
        ZStack{
            VStack{
                Text("Broccoli & Co.")
                    .font(.title).padding(20)
                
                Text("Please click below to get an invite")
                Button(action: {showSheet.toggle()}, label: {Text("Request an Invite")})
                }
            .sheet(isPresented: $showSheet, content: {
                Form {
                    Section(header: Text("User Details"), footer: Text("* denotes a mandatory field")) {
                        TextField("Full Name *", text: $fullName)
                        TextField("Email *", text: $email)
                        TextField("Confirm Email *", text: $confirmEmail)
                        
                    }
                }
                
                Button("Send") {
                    if (!fullName.isEmpty) {
                        formValid = true
                    }
                }.disabled(!formValid)
            })
            
            }
        }
        
    }


struct PreRequestView_Previews: PreviewProvider {
    static var previews: some View {
        PreRequestView()
    }
}
