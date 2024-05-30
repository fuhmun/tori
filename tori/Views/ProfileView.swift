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
            GeometryReader { geoProx in
                Color(CustomColor.grayBG)
                    .ignoresSafeArea()
                //                .opacity(0.3)
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .ignoresSafeArea()
                            .frame(height: 215)
                            .foregroundStyle(.blue)
                        VStack{
                            HStack {
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                }
                            }
                            .padding()
                            HStack{
                                Circle()
                                    .frame(width: 75)
                                    .overlay( Text("JW")
                                        .font(.title3)
                                        .fontWeight(.bold))
                                    .padding(.leading, 15)
                                Text("Jazz W.")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading, 15)
                                    .foregroundStyle(.white)
                                Spacer()
                                
                            }
                            .padding(.leading, 10)
                            Picker(selection: $selected, label: Text("")) {
                                Text("Must Try").tag(1)
                                Text("Visited").tag(2)
                                Text("Favorites").tag(3)
                            }
                            .padding([.leading, .trailing], 10)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .foregroundStyle(.thinMaterial)
                    }
                    Spacer()
                    ScrollView{
                        VStack{
                            if selected == 1 {
                                MustTryView(geoProx: geoProx)
                            }
                            else if selected == 2{
                                VisitedView(geoProx: geoProx)
                            }
                            else {
                                FavoritesView(geoProx: geoProx)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
