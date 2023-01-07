//
//  CongratulationsView.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 6/1/2023.
//

import SwiftUI

struct CongratulationsView: View {
    @Binding var fullName: String
    @Binding var email: String

    var body: some View {
        VStack{
            HStack(spacing: 0){
                Text("Congratulations ")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                Text("\(fullName)")
                    .font(.title2)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                Text("!")
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
            HStack{
                Text("Your invite has been sent to")
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
            HStack{
                Text("\(email)")
                    .font(.title2)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
            }
        }
        
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView(fullName: .constant(""), email: .constant(""))
    }
}
