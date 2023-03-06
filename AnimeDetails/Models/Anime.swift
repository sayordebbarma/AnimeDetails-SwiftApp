//
//  Anime.swift
//  AnimeDetails
//
//  Created by Sayor Debbarma on 06/03/23.
//

import SwiftUI

// Anime model
struct Book: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    var rating: Int
    var bookViews: Int
}
var sampleBooks: [Book] = [
    .init(title: "Naruto", imageName: "naruto", author: "Rachael Lippincott", rating: 4, bookViews: 1023),
    .init(title: "One Piece", imageName: "onePiece", author: "William B. Irvine", rating: 5, bookViews: 2049),
    .init(title:"Haikyuu", imageName: "haikyuu", author: "Anne", rating: 4, bookViews: 920),
    .init(title: "Blue Lock", imageName: "blueLock", author: "William Lippincott", rating: 3, bookViews: 560),
    .init(title: "Demon Slayer", imageName:"demonSlayer", author: "Jenna Lippincott", rating: 5, bookViews: 240),
]
