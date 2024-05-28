//
//  SearchBarView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI
import SwiftData

struct SearchBarView: View {
    
    @State var searchText: String = ""
    
    var geoProx: GeometryProxy
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? Color.black : Color.accentColor )
                TextField("What are you in the mood for?", text: $searchText)
                    .foregroundStyle(Color.accentColor)
                    .overlay(
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .offset(x: geoProx.size.width/20)
                            .foregroundStyle(.black)
                        
                        //.foregroundStyle(Color.accentColor)
                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                searchText = ""
                            }
                        ,alignment: .trailing)
            }
            .font(.headline)
            .padding(5)
            .padding(.horizontal, 5)
            .background(RoundedRectangle(cornerRadius: 7.50)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.30),radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
            )
            .frame(width: geoProx.size.width/1.2)
        }
}

//#Preview {
//    SearchBarView()
//}
