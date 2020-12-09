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
                .frame(width: geo.size.width, height: 263)
                .scaledToFill()
            VStack{
                Spacer()
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Spacer()
                    Text("REPO BY")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .opacity(0.6)
                    Text(AuthorName)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                HStack(){
                    Image(systemName: "star")
                    Text(Score)
                }
//                Spacer().frame(height: 22)
                }
                    Spacer()
                }
            }
        }
                HStack(){
                    Text(RepoTitle)
                    Spacer()
                    Text("View Online")
                }.padding(.horizontal)
                Text("Commits History")
                ScrollView{
                    CommitHistory()
                }.frame(width: geo.size.width - 16)
               
          
                Button(action: {
                   print("Sharing Repo")
                }) {
                    ZStack{
                        Rectangle()
                            .fill(Color(.secondarySystemBackground))
                            .frame( height: 50)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        HStack(){
                            Image(systemName: "share")
                                .foregroundColor(Color.blue)
                            Text("Share Repo")
                                .foregroundColor(Color.blue)
                            
                        }
                        
                    }
                }
                Spacer()
                    .frame(height: 44)
    }
}
}
}
struct CommitViewSample_Previews: PreviewProvider {
    static var previews: some View {
        CommitViewSample()
    }
}
