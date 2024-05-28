//
//  profileView.swift
//  Tori pages
//
//  Created by Leon Singleton on 5/26/24.
//

import SwiftUI

struct ProfileView: View {
    @State var selected = 1
    var body: some View {
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
                .opacity(0.3)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .ignoresSafeArea()
                        .frame(height: 215)
                        .foregroundStyle(.blue)
                    VStack{
                        HStack{Spacer()
                            Image(systemName: "gearshape.fill")
                        }
                        .padding()
                        HStack{
                            Circle()
                                .frame(width: 75)
                                .overlay( Text("JW")
                                    .font(.title3)
                                    .fontWeight(.bold))
                            Text("Jazz W.")
                                .fontWeight(.bold)
                            
                                .font(.largeTitle)
                                .padding(.leading, 30)
                            Spacer()
                            
                        }
                        .padding(.leading, 10)
                    
                        
                        Picker(selection: $selected, label: Text("")) {
                            Text("Must Try").tag(1)
                            Text("Visted").tag(2)
                            Text("Favorites").tag(3)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .foregroundStyle(.thinMaterial)
                }
                Spacer()
                ScrollView{
                    VStack{
                        if selected == 1 {
                            MustTryView()}
                        else if selected == 2{
                            VisitedView()
                        }
                        else {
                            FavoritesView()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
