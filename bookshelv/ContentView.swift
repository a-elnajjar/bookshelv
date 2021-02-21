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
    @State private var fileUrls:[URL]? = []
    

    func listDir(dir: String) -> [URL]? {
        let fileManager = FileManager.default
        let documentsURL = Bundle.main.resourceURL!.appendingPathComponent(dir)
        var fileUrls:[URL]?
        
        do {
            fileUrls = try fileManager.contentsOfDirectory(at:documentsURL, includingPropertiesForKeys: nil)
            return  fileUrls!
            
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
            return nil
        }
        
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List{
                        ForEach(fileUrls!, id: \.self) { fileUrl in
                            NavigationLink(destination: PDFKitView(url: fileUrl), isActive: $viewLocalPDF) {
                                Button(fileUrl.lastPathComponent){
                                    self.viewLocalPDF = true
                                }
                                .padding(.bottom, 20)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Bookshelv ", displayMode: .inline).onAppear {
                fileUrls = listDir(dir: "pdfs")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
