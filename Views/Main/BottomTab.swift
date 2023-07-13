//
//  BottomTab.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import CoreData

struct BottomTab: View {
    var body: some View {
        VStack {
            TabView {
                Feed()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchPageView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                Chat()
                    .tabItem {
                        Image(systemName: "text.bubble")
                    }
                ParkMap()
                    .tabItem {
                        Image(systemName: "map")
                    }
                Profile(username: "Max Diess", profileImage: Image("dog"))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                    }
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(Color("primary"))
                let itemAppearance = UITabBarItemAppearance()
                itemAppearance.selected.iconColor = .black
                itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
                itemAppearance.normal.iconColor = UIColor(Color("secondary"))
                itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
                appearance.stackedLayoutAppearance = itemAppearance
                appearance.inlineLayoutAppearance = itemAppearance
                appearance.compactInlineLayoutAppearance = itemAppearance
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}

struct BottomTab_Previews: PreviewProvider {
    static var previews: some View {
        BottomTab()
    }
}
