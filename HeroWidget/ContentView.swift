//
//  ContentView.swift
//  HeroWidget
//
//  Created by Melik Demiray on 27.12.2023.
//

import SwiftUI

struct ContentView: View {

    let heroes = [batman, wolwerine, deadpool]
    var body: some View {
        VStack {
            ForEach(heroes) { hero in HeroView(hero: hero)
            }
        }
    }
}

#Preview {
    ContentView()
}
