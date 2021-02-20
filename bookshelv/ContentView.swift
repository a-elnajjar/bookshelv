//
//  ContentView.swift
//  bookshelv
//
//  Created by Abdalla Elnajjar on 2021-02-19.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    
    @State private var viewLocalPDF = false
    let fileUrl = Bundle.main.url(forResource: "swift-style-second-edition_P1.0", withExtension:"pdf")!
    var body: some View {

        
        
        NavigationView {
                ZStack {
                    VStack {
                        NavigationLink(destination: PDFKitView(url: self.fileUrl), isActive: $viewLocalPDF) {
                            Button("view book"){
                                self.viewLocalPDF = true
                            }
                            .padding(.bottom, 20)
                        }
                    }
                }
                .navigationBarTitle("Bookshelv ", displayMode: .inline)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
