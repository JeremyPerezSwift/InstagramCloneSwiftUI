//
//  UploadPostView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI

struct UploadPostView: View {
    @ObservedObject var viewModel = UploadPostViewModel()
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    
    @Binding var selectedIndex: Int
    
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
                    
                    TextAreaView(text: $captionText, placeholder: "Enter your caption...")
                        .frame(height: 200)
                }
                .padding()
                
                HStack {
                    Button {
                        captionText = ""
                        postImage = nil
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width / 2.2, height: 50)
                            .background(.black.opacity(0.9))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    .padding(.top)
                    
                    Button {
                        guard let image = selectedImage else { return }
                        viewModel.uploadPost(caption: captionText, image: image) { error in
                            captionText = ""
                            postImage = nil
                            selectedIndex = 0
                        }
                    } label: {
                        Text("Share")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width / 2.2, height: 50)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    .padding(.top)
                }
                

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

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
