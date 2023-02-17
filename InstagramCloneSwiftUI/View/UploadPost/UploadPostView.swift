//
//  UploadPostView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image("add-button")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundStyle(.black)
                }
                .sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }

            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                    
                    TextField("Enter your caption...", text: $captionText)
                        .font(.system(size: 13))
                    
                }
                .padding()
                
                Button {
                    
                } label: {
                    Text("Share")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding(.top)

            }
            
            
            Spacer()
        }

    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else  { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
