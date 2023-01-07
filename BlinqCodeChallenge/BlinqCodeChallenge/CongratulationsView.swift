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
            Group {
                ConfettiView("Confetti")
                ConfettiView("Confetti")
                ConfettiView("Confetti")
            }
            
//            VStack{
////                ConfettiView("Confetti")
////                    .scaledToFill()
////                    .position(.zero)
//                ConfettiView("Confetti")
//                    .scaledToFill()
//                    .imageScale(.small)
////                    .frame(width: 600, height: 1100)
////                ConfettiView("Confetti")
////                    .padding(.vertical, -265.0)
////                ConfettiView("Confetti")
////                ConfettiView("Confetti")
////                    .frame(width: 600, height: 200)
////                ConfettiView("Confetti")
////                    .frame(width: 600, height:600)
//            }
            VStack{
                HStack(alignment: .center, spacing: 0){
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
            
        
            //            List(0..<10) { item in
            //                        ConfettiView("Confetti")
            //                            .frame(width: 200, height: 200)
            //
            //                    }
        }
        
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView(fullName: .constant(""), email: .constant(""))
    }
}
