//
//  GSTestApp.swift
//  GSTest
//
//  Created by Derek Nguyen on 1/28/21.
//

import SwiftUI
import Firebase
import GoogleSignIn


@main
struct GSTestApp: App {
    
    //Attach App Delegate to SwiftUI
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Initialize Firebase
        FirebaseApp.configure()
        
        //Initialize Google
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
      }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {return}
        
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken,
                                                       accessToken: user.authentication.accessToken)
        //Signin to Firebase
        Auth.auth().signIn(with: credential) { (result, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print(result?.user.email)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(error.localizedDescription)
    }

}
struct GSTestApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
