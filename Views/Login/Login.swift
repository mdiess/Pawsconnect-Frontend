//
//  Login.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import CoreData

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("primary")
                    .ignoresSafeArea()
                VStack(spacing:30) {
                    Text("PawsConnect")
                        .font(.custom("Optima-ExtraBlack", size:45))
                        .offset(y:-130)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 0)
                    VStack(spacing:30) {
                        TextField("Username", text: $username)
                            .padding()
                            .autocorrectionDisabled()
                            .frame(maxWidth:300, maxHeight:50)
                            .background(
                                Capsule()
                                    .strokeBorder(Color.white,lineWidth: 1)
                                    .background(Color.white)
                                    .clipped()
                            )
                            .clipShape(Capsule())
                            .offset(y:-80)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                            .padding()
                            .autocorrectionDisabled()
                            .frame(maxWidth:300, maxHeight:50)
                            .background(
                                Capsule()
                                    .strokeBorder(Color.white,lineWidth: 1)
                                    .background(Color.white)
                                    .clipped()
                            )
                            .clipShape(Capsule())
                            .offset(y:-80)
                            .autocapitalization(.none)
                        NavigationLink(destination: BottomTab()) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth:300, maxHeight:50)
                                .background(
                                    Capsule()
                                        .strokeBorder(Color("secondary"),lineWidth: 1)
                                        .background(Color("secondary"))
                                        .shadow(color:Color.black, radius:5, x:0, y:0)
                                        .clipped()
                                    
                                )
                                .clipShape(Capsule())
                        }
                    }
                    .shadow(color: Color.black, radius: 3, x: 0, y: 0)
                }
                .offset(y:-50)
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
