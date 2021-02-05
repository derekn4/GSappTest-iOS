//
//  ContentView.swift
//  GSTest
//
//  Created by Derek Nguyen on 1/28/21.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    
    @ObservedObject var info : AppDelegate
    
    var body: some View {
        VStack{
            Button(action: {
                //Log In User
                GIDSignIn.sharedInstance()?.presentingViewController =
                    UIApplication.shared.windows.first?.rootViewController
                
                GIDSignIn.sharedInstance()?.signIn()
                
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 45)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
            
            Text(info.email).padding(.top, 25)
        }
    }
}
