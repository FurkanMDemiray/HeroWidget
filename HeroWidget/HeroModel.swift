//
//  HeroModel.swift
//  HeroWidget
//
//  Created by Melik Demiray on 27.12.2023.
//

import Foundation


struct HeroModel: Identifiable, Codable {

    var id: String { image }
    var name: String
    var realName: String
    var image: String

}


let batman = HeroModel(name: "Batman", realName: "Bruce Wayne", image: "batman")
let wolwerine = HeroModel(name: "Wolverine", realName: "Logan", image: "wolverine")
let deadpool = HeroModel(name: "Deadpool", realName: "Wade Wilson", image: "deadpool")
