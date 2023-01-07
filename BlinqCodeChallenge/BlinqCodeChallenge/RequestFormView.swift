//
//  RequestFormView.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 6/1/2023.
//

import SwiftUI

struct RequestFormView: View {
    
    @State private var fullName = ""
    @State private var email = ""
    @State private var confirmEmail = ""
    @State private var formValid: Bool = false
    
    @State private var fullNameError = "Please enter your full name"
    @State private var emailError = "Please enter your email"
    @State private var confirmEmailError = "Please confirm your email"
    @State private var requestMessage = ""
    @State private var showCongratulationsView = false
    @Binding var showRequestForm: Bool
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("User Details"), footer: Text("* denotes a required field")) {
                    TextField("Full Name *", text: $fullName)
                    Text(fullNameError).foregroundColor(Color.red)
                    TextField("Email *", text: $email)
                    Text(emailError)
                        .foregroundColor(Color.red)
                    TextField("Confirm Email *", text: $confirmEmail)
                    Text(confirmEmailError)
                        .foregroundColor(Color.red)
                    
                }
                Button("Send") {
                    if (fullName.count < 3) {
                        fullNameError = "Please enter at least 3 characters"
                    }
                    else if (fullName.count >= 3) {
                        fullNameError = ""
                    }
                    
                    if (email.isEmpty || !isEmailValid(emailStr: email)) {
                        emailError = "Please enter a valid email"
                    }
                    else if (!email.isEmpty) {
                        emailError = ""
                    }
                    
                    if (email != confirmEmail) {
                        confirmEmailError = "The emails do not match, please try again"
                    }
                    else if (email == confirmEmail) {
                        confirmEmailError = ""
                    }
                    
                    
                    if (fullName.count >= 3 && !email.isEmpty && email == confirmEmail) {
                        requestMessage = "Your request is being sent"
                        requestMessage = saveToServer(userName: fullName, userEmail: email)
                    }
                    
                    if (requestMessage == "Registered") {
                        showCongratulationsView = true
                    }
                }
                Text(requestMessage)
                    .foregroundColor(Color.red)
            }
        }.sheet(isPresented: $showCongratulationsView) {
            NavigationView {
                CongratulationsView(fullName: $fullName, email: $email)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                showCongratulationsView = false
                                showRequestForm = false
                            }
                        }                        }
            }
        }
    }
    
    func isEmailValid(emailStr: String) -> Bool {
        let emailRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegx)
        
        return emailTest.evaluate(with: emailStr)
    }
}

struct RequestFormView_Previews: PreviewProvider {
    static var previews: some View {
        RequestFormView(showRequestForm: .constant(true))
    }
}
