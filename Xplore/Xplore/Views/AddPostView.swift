//
//  AddPostView.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct AddPostView: View {
    var plaecholderCountries = ["South Africa", "France", "Italy", "United States"]
    @State var selectedCountry = "South Afica"
    @State private var description = ""
    @State private var selectedImageURL: URL? = nil
    @StateObject private var viewModel=ImageUploadViewModel(storageManager: storageManager())

    
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Spacer()
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
                
                Spacer()
                
                Image("dark-blue-pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                
                Text("New Post")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53)).padding(.top, 5)
                
                Spacer()
            }.padding(.vertical)
        
            Divider()

            Spacer()
            PhotoPicker(imageUrl: $selectedImageURL)
            Spacer().frame(height: 40)
            VStack{
                Text("Description")
                    .fontWeight(.regular)
                    .font(.caption)
                    .frame(maxWidth: .infinity,alignment: .leading)
                TextEditor(text: $description)
                    .frame(maxHeight: 150)
                    .background(Color(.systemGray6))
                    .colorMultiply(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius:12))
                    
                Picker("Country: ", selection: $selectedCountry) {
                    ForEach(plaecholderCountries, id: \.self) { Country in
                        Text(Country.capitalized)
                    }
                }
                .frame(minHeight: 0, maxHeight: 115)
                .pickerStyle(.wheel)
            }
            .padding(.horizontal, 20)
            HStack{
                
                Button(action: {
                    if let imageURL = selectedImageURL {
                        print("Selected Image URL:", imageURL)
                    } else {
                        print("No image selected.")
                    }
                }) {
                    Text("Log Image URL")
                }
                .buttonStyle(.borderless)
                .frame(
                    maxWidth: .infinity)
                .tint(Color(red: 0.48, green: 0.53, blue: 0.95))
                Button(action: {
                    
                    viewModel.uploadImage(fromURL: selectedImageURL)}) {
                    Text("Add post")
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .tint(Color(red: 0.48, green: 0.53, blue: 0.95))
            }
                
            Spacer()
        }
        
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
