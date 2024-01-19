//
//  EditProfileView.swift
//  SwiftUIChat
//
//  Created by Auto on 5/1/24.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @State private var fullName = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @ObservedObject var viewModel: EditProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    init(_ viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 44) {
                //Header
                VStack {
                    //Photo, Edit Button, Text
                    HStack {
                        //Photo, Edit Button
                        VStack {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                KFImage(URL(string: viewModel.user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
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
                    
                    TextField("Update your name", text: $fullName)
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
                        destination: StatusSelectorView(viewModel),
                        label: {
                            HStack {
                                Text(viewModel.user.status.title)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                        })
                }
                
                Spacer()
            }
            
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: doneButton)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
    var doneButton: some View {
        Button(action: {
            Task {
                viewModel.updateName(fullName)
                dismiss()
            }
        }, label: {
            Text("Done")
        })
    }
}

//#Preview {
//    EditProfileView()
//}
