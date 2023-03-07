//
//  Anime.swift
//  AnimeDetails
//
//  Created by Sayor Debbarma on 06/03/23.
//

import SwiftUI

// Anime model
struct Anime: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var episodes: Int
    var Status: String
    var rating: Int
    var totalViews: Int
}
var sampleAnimes: [Anime] = [
    .init(title: "Naruto: Shippuden", imageName: "naruto", episodes: 500, Status: "Completed", rating: 5, totalViews: 102334234),
    .init(title: "One Piece", imageName: "onePiece", episodes: 1053, Status: "Airing", rating: 5, totalViews: 20494234),
    .init(title:"Haikyuu", imageName: "haikyuu", episodes: 25, Status: "Completed", rating: 4, totalViews: 920343),
    .init(title: "Blue Lock", imageName: "blueLock", episodes: 21, Status: "Airing", rating: 3, totalViews: 56034323),
    .init(title: "Demon Slayer", imageName:"demonSlayer", episodes: 26, Status: "Completed", rating: 5, totalViews: 243230),
    .init(title: "My Hero Academia", imageName:"MyHeroAcademia", episodes: 13, Status: "Completed", rating: 5, totalViews: 24320),
]
