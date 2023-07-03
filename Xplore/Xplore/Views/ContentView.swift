//
//  ContentView.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isSearching = false
    @State private var userId = ""
    @State var randomCountryIndexNumber = 0
    
    @ObservedObject private var countryData = countryViewModel()
    
    @ObservedObject private var userVM = UserStateViewModel()
    
    @State var searchTerm: String = ""
    
    @State private var randomCountry: Country = Country()
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 0) {
                    TopMap()
                        .frame(height: 160)
                    
                    VStack(alignment: .leading) {
                        Text("Discover")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 28, weight: .bold, design: .monospaced))
                        
                        SearchInput(text: $searchTerm, isSearching: $isSearching, Data: $countryData.countries)
                            
                        
                        if searchTerm.count > 0 {
                            VStack {
                                Spacer()
                                SearchDropdown(searchTerm: $searchTerm, Data: $countryData.countries)
                            }
                        }
                    }
                    .padding(.horizontal, 35)
                    Spacer().padding(.vertical, 30)
                    ZStack {
                        Image("CountryBg")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                        
                        GeometryReader { geometry in
                            Image("purple-pin")
                                .resizable()
                                .offset(y: 6)
                                .offset(x: 0)
                                .frame(minWidth: 0, maxWidth: 35, minHeight: 0, maxHeight: 50)
                                .rotationEffect(.degrees(-38))
                        }
                        
                        VStack(spacing: 10) {
                            NavigationLink {
                                CountryDetailView(countryData: $randomCountry)
                            } label: {
                                AsyncImage(url: URL(string: randomCountry.flags?.png ?? "SAFLAG")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                                        .frame(minWidth: 0, maxWidth: 270, minHeight: 0, maxHeight: 200)
                                } placeholder: {
                                    // Placeholder image or view
                                }
                            }

//                            Image(randomCountry.flags?.png ?? "")
//                                .resizable()
//                                .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
//                                .frame(minWidth: 0, maxWidth: 270, minHeight: 0, maxHeight: 200)
                            
                            Text(randomCountry.name?.common ?? "Could not find name")
                                .font(.system(size: 24, weight: .bold, design: .monospaced))
                        }
                        .zIndex(1)
                    }
                    .padding(.horizontal, isSearching ? 35 : 15)
                    .zIndex(0)
                }
            }
            .onAppear {
                self.countryData.fetchData()
            }
            .onChange(of: countryData.countries.indices) { _ in
                var randomValue = generateRandomNumberInRange(maxRange: countryData.countries.count)
                randomCountry = countryData.countries[randomValue]
                print(countryData.countries[randomValue])
            }
            
        }
        
    }
}

func generateRandomNumberInRange(maxRange: Int) -> Int {
    let dataLength = maxRange
    let randomIndex = Int.random(in: 0..<dataLength)
    print(randomIndex)
    return randomIndex
}
    //    private func addItem() {
    //        withAnimation {
    //            let newItem = Item(context: viewContext)
    //            newItem.timestamp = Date()
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    //
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { items[$0] }.forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    //}
    //
    //private let itemFormatter: DateFormatter = {
    //    let formatter = DateFormatter()
    //    formatter.dateStyle = .short
    //    formatter.timeStyle = .medium
    //    return formatter
    //}()
    
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//        }
//    }
//
