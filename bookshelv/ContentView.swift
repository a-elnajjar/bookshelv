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
    let fileUrl1 = Bundle.main.url(forResource: "swift-style-second-edition_P1.0", withExtension:"pdf")!
    let fileUrl2 = Bundle.main.url(forResource: "ASPNETInterviewQuestions", withExtension:"pdf")!
    let fileUrl3 = Bundle.main.url(forResource: "DotNETCoreInterviewQuestions", withExtension:"pdf")!
    var body: some View {

        
        
        NavigationView {
                ZStack {
                    VStack {
                        NavigationLink(destination: PDFKitView(url: self.fileUrl1), isActive: $viewLocalPDF) {
                            Button("Swift Style"){
                                self.viewLocalPDF = true
                            }
                            .padding(.bottom, 20)
                        }
                        NavigationLink(destination: PDFKitView(url: self.fileUrl2), isActive: $viewLocalPDF) {
                            Button("ASP .NET Interview Questions"){
                                self.viewLocalPDF = true
                            }
                            .padding(.bottom, 20)
                        }
                        NavigationLink(destination: PDFKitView(url: self.fileUrl3), isActive: $viewLocalPDF) {
                            Button(".NET Core Interview Questions"){
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
