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
        ZStack{
            ConfettiView("Confetti")
            VStack{
                HStack(alignment: .center, spacing: 0){
                    Text("Congratulations")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    Text(" \(fullName)")
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
            Image("HappyBroccoli").resizable().aspectRatio(contentMode: .fit).padding(.top, 0.0).frame(width: 307, height: 301).position(CGPoint(x: 210, y: 700))
        }
        
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView(fullName: .constant(""), email: .constant(""))
    }
}
