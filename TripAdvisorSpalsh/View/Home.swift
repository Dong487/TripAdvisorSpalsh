//
//  Home.swift
//  TripAdvisorSpalsh
//
//  Created by DONG SHENG on 2021/12/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical , showsIndicators: false){
                VStack(spacing: 15){
                    ForEach(1...6 ,id: \.self){ index in
                        
                        GeometryReader { proxy in
                            let size = proxy.size
                            
                            Image("post\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .cornerRadius(15)
                        }
                        .frame(height: 250)
                    }
                }
                .padding()
            }
            .navigationTitle("Home View")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
