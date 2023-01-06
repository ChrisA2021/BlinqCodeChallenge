//
//  PreRequestView.swift
//  BlinqCodeChallenge
//
//  Created by Chrishane Amarasekara on 2/1/2023.
//

import SwiftUI

struct PreRequestView: View {
    
    @State private var showRequestForm = false
    
    
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
                    RequestFormView()
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
        PreRequestView()
    }
}

let DomainURL = "https://us-central1-blinkapp-684c1.cloudfunctions.net/fakeAuth"

class API : Codable{
    
    static func fetch(withID id : Int, completionHandler: @escaping (API)->Void) {
        let urlString = DomainURL + "name/id"
        
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url,
                                                  completionHandler: { (data, response, error) in
                print(String.init(data: data!, encoding: .ascii) ??
                      "no data")
                
            })
            task.resume()
        }
    }
    
    
}
