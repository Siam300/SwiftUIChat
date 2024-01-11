//
//  EditProfileView.swift
//  SwiftUIChat
//
//  Created by Auto on 5/1/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullName = "Full Name"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                VStack {
                    //Header
                    //Photo, Edit Button, Text
                    
                    HStack(alignment: .center) {
                        //Photo, Edit Button
                        VStack(alignment: .center) {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("Edit")
                            })
                            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                                ImagePicker(image: $selectedImage)
                            }
                        }
                        .padding(.top)
                        
                        Text("Enter your name or change your profile photo")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.horizontal, .bottom])
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("", text: $fullName)
                        .padding(8)
                }
                .background(.white)
                
                //Status
                VStack(alignment: .leading) {
                    //Status Text
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    
                    //Status
                    NavigationLink(
                        destination: StatusSelectorView(),
                        label: {
                            HStack(alignment: .center) {
                                Text("Available")
                                    .frame(height: 50)
                                    .padding(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            }
                            .background(Color.white)
                        })
                    
                }
                
                Spacer()
            }
            
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    EditProfileView()
}
