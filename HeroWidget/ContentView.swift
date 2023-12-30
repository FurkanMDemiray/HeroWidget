//
//  ContentView.swift
//  HeroWidget
//
//  Created by Melik Demiray on 27.12.2023.
//

import SwiftUI
import WidgetKit

struct ContentView: View {

    //@AppStorage ("hero", store: UserDefaults(suiteName: "group.com.melikdemiray.HeroWidget"))
    //var data: Data = Data()

    let heroes = [batman, wolwerine, deadpool]
    var body: some View {
        VStack {
            ForEach(heroes) { hero in HeroView(hero: hero)
                    .onTapGesture {
                    saveTheHero(hero: hero)
                }
            }
        }
    }


    func saveTheHero(hero: HeroModel) {
        print(hero.name)

        if let data = try? JSONEncoder().encode(hero) {
            //self.data = data
            UserDefaults.standard.set(data, forKey: "hero")
            UserDefaults.standard.synchronize()
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
}

#Preview {
    ContentView()
}
