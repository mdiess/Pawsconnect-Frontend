//
//  ContentView.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color("primary")
                    .ignoresSafeArea()
                VStack(spacing:-100) {
                    Image("paw-png")
                        .resizable()
                        .frame(width:450, height:450)
                        .offset(y:-150)
                        .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                    Text("PawsConnect")
                        .font(.custom("Optima-ExtraBlack", size:45))
                        .offset(y:-130)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 0)
                    HStack {
                        NavigationLink(destination: Login()){
                            Text("Login")
                                .font(.headline)
                                .underline(color: .black)
                                .foregroundColor(.black)
                        }
                        Text("|")
                        NavigationLink(destination: Login()){
                            Text("Create Account")
                                .font(.headline)
                                .underline(color: .black)
                                .foregroundColor(.black)
                        }
                    }
                    .offset(y:250)
                }
                .offset(y:-50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
