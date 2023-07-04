//
//  AddPostView.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct AddPostView: View {
    @Binding var selectedTab: Int
    @State var selectedCountry: Int = 0
  @State private var description = ""
  @State private var selectedImageURL: URL? = nil
  @StateObject private var viewModel = ImageUploadViewModel(storageManager: StorageManager())
  @State private var firebaseViewModel = PostViewModel()
  @ObservedObject private var countryData = countryViewModel()
  @ObservedObject private var userVm = UserStateViewModel()
    
  var body: some View {
      ScrollView {
        VStack {
          HStack(alignment: .center) {
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
                .onAppear {
                    selectedImageURL = nil
                    if selectedImageURL == nil {
                        // Set a default image URL here
                        selectedImageURL = URL(string: "photo")
                    }
                }
          Spacer().frame(height: 40)
          VStack {
            Text("Description")
              .fontWeight(.regular)
              .font(.caption)
              .frame(maxWidth: .infinity, alignment: .leading)
            TextEditor(text: $description)
              .frame(minHeight: 150, maxHeight: 150)
              .background(Color(.systemGray6))
              .colorMultiply(Color(.systemGray6))
              .clipShape(RoundedRectangle(cornerRadius: 12))

              Picker("Country: ", selection: $selectedCountry) {
                  ForEach(countryData.countries.indices.sorted { (index1, index2) -> Bool in
                      let country1 = countryData.countries[index1]
                      let country2 = countryData.countries[index2]
                      return country1.name?.common ?? "" < country2.name?.common ?? ""
                  }, id: \.self) { index in
                      let country = countryData.countries[index]
                      Text(country.name?.common ?? " ")
                  }
              }
              .frame(minHeight: 0, maxHeight: 115)
              .pickerStyle(.wheel)
          }
          .padding(.horizontal, 20)
          Spacer()
          HStack {

            Button(action: {
                selectedImageURL = nil
                description = ""
            }) {
              Text("Cancel")
            }
            .buttonStyle(.borderless)
            .frame(
              maxWidth: .infinity
            )
            .tint(Color(red: 0.48, green: 0.53, blue: 0.95))
              Button(action:{
                  Task{
                      selectedTab = 3
                      try await firebaseViewModel.addUserPost(
                          userId: userVm.getUserId(), postImage: selectedImageURL,
                          postDescription: description, postCountry: countryData.countries[selectedCountry].name?.common ?? "None"
                      )
                    selectedImageURL = nil
                    description = ""
                  }
                  
  //                print("COUNTRY \(countryData.countries[selectedCountry].name?.common)")
              }) {
                  Text("Add post")
              }
              .buttonStyle(.borderedProminent)
              .frame(maxWidth: .infinity)
              .tint(Color(red: 0.48, green: 0.53, blue: 0.95))
          }
          Spacer()

        }
      .environmentObject(firebaseViewModel)
      .onTapGesture {
          self.hideKeyboard()
        }
      .onAppear() {
          self.countryData.fetchData()
      }
      }
  }
}

#if canImport(UIKit)
  extension View {
    func hideKeyboard() {
      UIApplication.shared.sendAction(
        #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
  }
#endif

struct AddPostView_Previews: PreviewProvider {
  static var previews: some View {
    AddPostView()
  }
}
