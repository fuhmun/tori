//
//  profileView.swift
//  Tori pages
//
//  Created by Leon Singleton on 5/26/24.
//

import SwiftUI
import AppIntents
import PhotosUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct ProfileView: View {
    @State var selected = 1
    @State private var selectedImage: UIImage?
    @State private var showSheet: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showImagePicker = false
    var body: some View {
        GeometryReader { geoProx in
            VStack {
                //Top half
                ZStack {
                    Image("ProfileBackground")
                        .scaledToFill()
                        .ignoresSafeArea(.all)
                        .frame(width: geoProx.size.width, height: geoProx.size.height * 0.25)
                        .offset(y: -geoProx.size.height * 0.15)
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing)
                        }
                        HStack{
                            Button {
                                showSheet = true
                            } label: {
                                if let selectedImage = selectedImage {
                                    Image(uiImage: selectedImage)
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: geoProx.size.width * 0.2, height: geoProx.size.width * 0.2)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        .shadow(radius: 5)
                                } else {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: geoProx.size.width * 0.2, height: geoProx.size.width * 0.2)
                                        .overlay(Text("JW")
                                            .font(.title2)
                                            .fontWeight(.bold))
                                        .foregroundColor(.gray)
                                }
                            }
                            .actionSheet(isPresented: $showSheet, content: {
                                ActionSheet(title: Text("Select an option"), buttons: [
                                    .default(Text("Select from Gallery")) {
                                        sourceType = .photoLibrary
                                        showImagePicker = true
                                    },
                                    .default(Text("Camera")) {
                                        sourceType = .camera
                                        showImagePicker = true
                                    },
                                    .cancel()
                                ])
                            })
                            .sheet(isPresented: $showImagePicker) {
                                ImagePicker(sourceType: sourceType, selectedImage: $selectedImage)
                                    .ignoresSafeArea()
                            }
                            .padding(.leading)
                            
                            Text("Jazz W.")
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .padding(.leading, 15)
                                .foregroundStyle(.white)
                            Spacer()
                            
                        }
                        Picker(selection: $selected, label: Text("")) {
                            Text("Must Try").tag(1)
                            Text("Visited").tag(2)
                            Text("Favorites").tag(3)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .foregroundStyle(.thinMaterial)
                        .padding(.leading)
                        .padding(.trailing)
                    }
                }
                
                
                //Bottom half
                ZStack {
                    Color(CustomColor.grayBG)
                    ScrollView{
                        VStack{
                            Spacer()
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
