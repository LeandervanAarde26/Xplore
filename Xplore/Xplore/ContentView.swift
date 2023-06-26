//
//  ContentView.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @ObservedObject private var viewModel = testViewModel()
    var body: some View {
        VStack{
//            ALL Content will go in here
//            Image and logo to be in the VSTACK below
            VStack{
                Text("Discover")
            }
            .frame(height: 140)
            .background(Color.blue)
            VStack(alignment: .leading){
                Text("Discover")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
//                    .background(Color.orange)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                SearchInput(text: .constant(""))
                    
            }
            .padding(.horizontal, 35)
            
            VStack{
                ZStack{
                    Image("CountryBg")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
//                        .frame(
//                            minWidth: 0,
//                            maxWidth: .infinity,
//                            minHeight: 0,
//                            maxHeight: 350
//                        )
                    
                    GeometryReader { geometry in
                        Image("purple-pin")
                            .resizable()
                            .offset(y: 6)
                            .offset(x: 0)
                            .frame(
                                minWidth: 0,
                                maxWidth: 35,
                                minHeight: 0,
                                maxHeight: 50
                            )
                            .rotationEffect(.degrees(-38))
                    }
                    
                    VStack(spacing: 10){
                        Image("SAFLAG")
                            .resizable()
                            .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                            .frame(
                                minWidth: 0,
                                maxWidth: 270,
                                minHeight: 0,
                                maxHeight: 200
                            )
                        
                        Text("Country name")
                            .font(.system(size: 24, weight: .bold, design: .monospaced))
                    }
                    
                }
     
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    
                    maxHeight: 400
                )
           
            }
//            .background(<#T##Background#>)
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 0,
          maxHeight: .infinity,
          alignment: .topLeading
        )
        .padding(15)
    
//        List(viewModel.testData){ test in
//            VStack(alignment : .leading){
//                Text(test.name).font(.title)
//            }
//        }.onAppear(){
//            self.viewModel.fetchData()
//        }
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
