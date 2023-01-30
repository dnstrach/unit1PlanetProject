//
//  Planet.swift
//  Planet
//
//  Created by Dominique Strachan on 12/13/22.
//

import Foundation

/*
 planet name
 planet description
 planet type
 distance from sun
 ring count
 moon count
 --> planet image
*/

class Planet {
    //creating types planet class
    let planetName: String
    let planetDescription: String
    let imageName: String
    let orderNumber: Int
    let planetType: String
    let moonCount: Int
    let ringCount: Int
    let distanceFromSun: Double
    var isFavorite: Bool //true or false
    
    //memberwise initializer
    //initial values are equal to variable that holds type
    init(planetName: String, planetDescription: String, orderNumber: Int, planetType: String, moonCount: Int, ringCount: Int, distanceFromSun: Double, isFavorite: Bool = false) {
        self.planetName = planetName
        self.planetDescription = planetDescription
        self.imageName = planetName.lowercased()
        self.orderNumber = orderNumber
        self.planetType = planetType
        self.moonCount = moonCount
        self.ringCount = ringCount
        self.distanceFromSun = distanceFromSun
        self.isFavorite = isFavorite
    }
}

//var arrayPlanets: [Planet] {
//    Planet(planetName: <#T##String#>, planetDescription: <#T##String#>, imageName: <#T##String#>, orderNumber: <#T##Int#>, planetType: <#T##String#>, moonCount: <#T##Int#>, ringCount: <#T##Int#>, distanceFromSun: <#T##Double#>)
//}

//creating enum because there's 3 cases for planet type
enum PlanetType: String {
    case iceGiant = "Ice Giant"
    case gasGiant = "Gas Giant"
    case terrestrial = "Terrestrial"
}
