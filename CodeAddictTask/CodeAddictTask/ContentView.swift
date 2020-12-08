//
//  ContentView.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 08/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    
    var body: some View {
        NavigationView{
         
        }.navigationTitle("Search")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
