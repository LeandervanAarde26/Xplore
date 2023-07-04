//
//  FeedView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/27.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        VStack(){
            HStack(alignment: .center){
                
                Spacer()
                
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
                
                Spacer()
                
                Image("yellow-pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                
                Text("Feed")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53)).padding(.top, 5)
                
                Spacer()
                
            }.padding(.top, 10)
            
            Divider()
            
            ScrollView {
                ForEach(viewModel.posts.indices, id: \.self) { index in
                    let post = viewModel.posts[index]

                    if let description = post.description,
                       let username = post.user?.username,
                       let image = post.image,
                       let userImage = post.user?.profileURL,
                       let country = post.country {
                        FeedComp(
                            ContextualType: .constant("Test \(index)"),
                            Desc: .constant(description),
                            Username: .constant(username),
                            UserImage: .constant(userImage),
                            CountryName: .constant(country),
                            CountryImage: .constant(image)
                        )
                    }
                }
            }.onAppear{
                self.viewModel.getAllPosts()
            }
            
            Spacer()
        }
    }
    
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
