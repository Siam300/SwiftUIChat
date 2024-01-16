//
//  CreateChannelView.swift
//  SwiftUIChat
//
//  Created by Auto on 16/1/24.
//

import SwiftUI

struct CreateChannelView: View {
    @State private var channelName = ""
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var channelImage: Image?
    @ObservedObject var viewModel: CreateChannelViewModel
    @Binding var show: Bool
    
    init(_ selectableUsers: [SelectableUser], show: Binding<Bool>) {
        self.viewModel = CreateChannelViewModel(selectableUsers)
        self._show = show
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    let image = channelImage == nil ? Image("plus_photo") : channelImage!
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                })
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
                .padding(.leading)
                
                VStack(alignment: .leading, spacing: 12) {
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color(.separator))
                    
                    TextField("Enter a name for your channel", text: $channelName)
                        .font(.system(size: 15))
                    
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color(.separator))
                    
                    Text("Please provide a channel name and icon")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                .padding()
            }
            
            Spacer()
        }
        .onReceive(viewModel.$didCreateChannel, perform: { completed in
            if completed {
                show.toggle()
            }
        })
        .navigationTitle("Create Channel")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: createChannelButton)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        channelImage = Image(uiImage: selectedImage)
    }
    
    var createChannelButton: some View {
        Button(action: {
            viewModel.createChannel(name: channelName, image: selectedImage)
        }, label: {
            Text("Create").bold()
                .disabled(channelName.isEmpty)
        })
    }
}

//#Preview {
//    CreateChannelView()
//}
