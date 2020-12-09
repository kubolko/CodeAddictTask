//
//  CommitViewSample.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 09/12/2020.
//

import SwiftUI

struct CommitViewSample: View {
    let Imagee: String = "Sample"
    let AuthorName: String = "RepoAuthorName"
    let Score: String = "420"
    let RepoTitle: String = "RepoTitle"
    
    var body: some View {
        GeometryReader{ geo in
            VStack(){
        ZStack(){
            Image(Imagee)
                .resizable()
                .frame(height: 263)
                .scaledToFill()
            VStack(){
                Spacer()
                Text("Repo by")
                Text(AuthorName)
                HStack(){
                    Image(systemName: "star")
                    Text(Score)
                }
            }
        }
                HStack(){
                    Text(RepoTitle)
                    Spacer()
                    Text("View Online")
                }
    }
}
}
}
struct CommitViewSample_Previews: PreviewProvider {
    static var previews: some View {
        CommitViewSample()
    }
}
