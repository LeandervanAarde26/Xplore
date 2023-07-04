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
    @StateObject private var viewModel = ImageUploadViewModel(storageManager: StorageManager())
    @State private var firebaseViewModel = PostViewModel()
    @ObservedObject private var countryData = countryViewModel()
    @EnvironmentObject private var userVm: UserStateViewModel
    
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
                ForEach(countryData.countries.sorted { $0.name?.common ?? "" < $1.name?.common ?? "" })  { country in
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
                    firebaseViewModel.addUserPost(
                        userId: userVm.getUserId(), postImage: selectedImageURL,
                        postDescription: description, postCountry: selectedCountry
                    )
                }
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
        print("Hey post view this is the user details")
        print(userVm.userDetails ?? "No user details was found")
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
