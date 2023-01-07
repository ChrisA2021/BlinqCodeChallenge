//
//  SuccessfulCancelView.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 8/1/2023.
//

import SwiftUI

struct SuccessfulCancelView: View {
    
    var body: some View {
        ZStack{
            ConfettiView("Confetti")
            VStack{
                Spacer()
                HStack(alignment: .center){
                    Text("Your invite has been cancelled successfully")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 400.0)
//                        .position(CGPoint(x: 210, y: 100))
                }
            }
            Image("SadBroccoli").resizable().aspectRatio(contentMode: .fit).padding(.bottom, 0.0).frame(width: 307, height: 301).position(CGPoint(x: 210, y: 700))
        }
    }
}

struct SuccessfulCancelView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulCancelView()
    }
}
