//
//  CommitViewSample.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 09/12/2020.
//

import SwiftUI

struct CommitView: View {
   
    let repo : Repository
    
    var body: some View {
        GeometryReader{ geo in
            VStack(){
        ZStack(){
            Image("Sample")
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
                        Text(repo.fullName)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                HStack(){
                    Image(systemName: "star")
                    Text("\(repo.stargazersCount)")
                }
                Spacer().frame(height: 22)
                }.padding(.horizontal)
                    Spacer()
                }
            }
        }
                HStack(){
                    Text(repo.fullName)
                        .font(.headline)
                    Spacer()
                    Button(action: {
                       print("Sharing Repo")
                    }){ZStack(){
                        Rectangle()
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: 118, height: 30)
                            .cornerRadius(17)
                        Text("View Online")
                            .font(.callout)
                            .foregroundColor(Color.blue)
                        
                    }
                    
                    }
                }.padding(.horizontal)
                HStack(){
                    Text("Commits History")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }.padding(.horizontal)
                ScrollView{
                    CommitHistory()
                    Spacer()
                }.frame(width: geo.size.width - 16)
               
          Spacer()
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
        }.edgesIgnoringSafeArea(.all)
        
    }
}



