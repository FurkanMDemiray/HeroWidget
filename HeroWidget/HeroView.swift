//
//  HeroView.swift
//  HeroWidget
//
//  Created by Melik Demiray on 28.12.2023.
//

import SwiftUI

struct HeroView: View {

    var hero: HeroModel

    var body: some View {
        
        HStack {
            CircularImageSwiftUIView(image: Image(hero.image))
                .frame(width: 100, height: 100, alignment: .center)
            VStack {
                Text(hero.name)
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(width: 120)               
                Text(hero.realName)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }.padding()
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
            .padding()
        
    }
}

#Preview {
    HeroView(hero: wolwerine)
}
