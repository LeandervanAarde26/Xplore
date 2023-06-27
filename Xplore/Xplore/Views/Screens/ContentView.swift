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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TopMap()
                    .frame(height: 160)
                
                VStack(alignment: .leading) {
                    Text("Discover")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 28, weight: .bold, design: .monospaced))
                    
                    SearchInput(text: .constant(""), isSearching: $isSearching)
                        
                    
                    if isSearching {
                        GeometryReader { geometry in
                            HStack {
                                Spacer()
                                SearchDropdown()
                                Spacer()
                            }
                            .frame(width: geometry.size.width)
                            .transition(.opacity)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3.7)
                    }
                }
                .padding(.horizontal, 35)
                Spacer().padding(20)
                
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
                        Image("SAFLAG")
                            .resizable()
                            .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: 270, minHeight: 0, maxHeight: 200)
                        
                        Text("Country name")
                            .font(.system(size: 24, weight: .bold, design: .monospaced))
                    }
                    .zIndex(1)
                }
                .padding(.horizontal, isSearching ? 35 : 15)
                .zIndex(0)
            }
        }
    }
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
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
    
