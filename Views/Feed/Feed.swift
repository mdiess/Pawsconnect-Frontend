//
//  Feed.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import CoreData

struct Feed: View {
    @State private var showHeader = true
    @State private var scannedQRCode: String = ""
    @State private var showQRCode = false
    @State private var scannedQRCodeFeed: String?
    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    Group {
                        Divider()
                        OnePost(profileImage: Image("dog"),
                                 postImage: Image("golden_pups"),
                                 username: "max_diess",
                                 caption: "Beautiful day at the park!",
                                 likesCount: 1567,
                                 commentsCount: 238)
                        Divider()
                        OnePost(profileImage: Image("dog2"),
                                 postImage: Image("dog1"),
                                 username: "john_doe",
                                 caption: "Loving the sun :)",
                                 likesCount: 923,
                                 commentsCount: 34)
                        Divider()
                        OnePost(profileImage: Image("dog3"),
                                 postImage: Image("dog4"),
                                 username: "alice_johnson",
                                 caption: "Picture day was fantastic!",
                                 likesCount: 142,
                                 commentsCount: 21)
                    }
                }
            }
            .overlay(
                VStack {
                    if showHeader {
                        HStack {
                            Text("PawsConnect")
                                .font(.custom("Optima-ExtraBlack", size:20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.leading, 60)
                                .padding(.top, 20)
                                .frame(height: 70)
                            Image(systemName: "camera.fill")
                                .padding(.trailing, 25)
                                .padding(.top)
                                .foregroundColor(Color("secondary"))
                                .onTapGesture {
                                    showQRCode = true
                                }
                                .sheet(isPresented: $showQRCode) {
//                                    QRCodeScanner { qrCodeValue in
//                                            scannedQRCode = qrCodeValue
//                                            showQRCode = false
//                                        }
//                                    QRCodeScanner()
                                    ScannerView(scannedCode: $scannedQRCodeFeed)
                                }
                        }
                        .background(Color("primary"))
                        Divider()
                            .offset(y:-3)
                    }
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)
            )
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
        }
        .onChange(of: showHeader) { newValue in
            UITableView.appearance().backgroundColor = newValue ? .clear : .white
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
