//
//  ContentView.swift
//  GSTest
//
//  Created by Derek Nguyen on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            Button(action: {
                //Log In User
                
                
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 45)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
