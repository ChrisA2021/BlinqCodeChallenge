//
//  APIRequester.swift
//  BlinqCodeChallenge
//
//  Created by Postman(software) on 5/1/2023.
//  Modified by Chrishane Amarasekara on 5/1/2023.
//

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

func saveToServer(userName: String, userEmail: String) -> String {
    var returnMessage = ""
    let semaphore = DispatchSemaphore (value: 0)

    let parameters = "name=" + userName + "&email=" + userEmail
    let postData =  parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: "https://us-central1-blinkapp-684c1.cloudfunctions.net/fakeAuth")!,timeoutInterval: Double.infinity)
    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "POST"
    request.httpBody = postData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        returnMessage = String(describing: error)
        semaphore.signal()
        return
      }
      print(String(data: data, encoding: .utf8)!)
      returnMessage = String(decoding: data, as: UTF8.self)
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()
    
    return returnMessage

}
