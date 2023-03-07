//
//  Home.swift
//  AnimeDetails
//
//  Created by Sayor Debbarma on 06/03/23.
//

import SwiftUI

struct Home: View {
    @State private var activeGerne: String = "Romance"
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Anime")
                    .font(.largeTitle.bold())
                Text("Recommended")
                    .fontWeight(.semibold)
                    .padding(.leading, 15)
                    .foregroundColor(.gray)
                    .offset(y: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            gerneView()
            
            ScrollView(.vertical, showsIndicators: false) {
                // Anime cardView
                VStack(spacing: 25) {
                    ForEach(sampleAnimes) {
                        AnimeCardView($0)
                    }
                }
                .padding(15)
                
            }
            // Since we need offset from here and not from global View
            .coordinateSpace (name: "SCROLLVIEW")
        }
    }
    
    @ViewBuilder
    func AnimeCardView(_ anime: Anime) -> some View {
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named("SCROLLVIEW"))
            
            HStack(spacing: -25) {
                //-25 to place the card above the coverImane
                //book coverImage
                ZStack {
                    Image(anime.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame (width: size.width / 2, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.09), radius: 4, x: 5, y: 5)
                                .shadow(color: .black.opacity(0.09), radius: 4, x: -5, y: -5)
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                //book detailView
                VStack(alignment: .leading, spacing: 0) {
                    Text(anime.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text("\(anime.episodes) eps")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("- \(anime.Status)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 4)
                    
                    //ratingView
                    ratingView(rating: anime.rating)
                        .padding(.top, 10)
                    
                    Spacer(minLength: 10)
                    
                    HStack(spacing: 4) {
                        Text("\(anime.totalViews)")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text("views")
                            .font(.caption2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                .padding(20)
                .frame (width: size.width / 2, height: size.height * 0.85)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.09), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.09), radius: 8, x: -5, y: -5)
                }
                .zIndex(1)
            }
            .frame(width: size.width)
        }
        .frame(height: 250)
    }
    
    
        @ViewBuilder
        func gerneView() -> some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(gernes, id: \.self) { gerne in
                        Text(gerne)
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 5)
                            .background {
                                if activeGerne == gerne {
                                    Capsule()
                                        .fill(Color("Blue"))
                                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                } else {
                                    Capsule()
                                        .fill(.gray.opacity(0.2))
                                }
                            }
                            .foregroundColor(activeGerne == gerne ? .white : .gray)
                        //change activeGerne on tap
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                    activeGerne = gerne
                                }
                            }
                }
            }
                .padding(.horizontal, 15)
        }
    }
}

//gernes
var gernes: [String] = [
    "Action", "Ecchi", "Romance", "School", "Adventure", "Drama", "Comedy", "Demons"
]

struct ratingView: View {
    var rating: Int
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundColor(index <= rating ? .yellow : .gray.opacity(0.5))
            }
            
            Text("(\(rating)/5)")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
                .padding(.leading, 5)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
