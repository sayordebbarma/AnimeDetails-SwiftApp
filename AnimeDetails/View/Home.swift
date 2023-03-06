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
            
            
        }
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
