//
//  CommitView.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 08/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct Repo : View {

    let repo: Repository
    
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(Color.secondary)
                .frame(width: 343, height: 92)
            HStack(){
                Spacer()
                    .frame(width: 16)
                WebImage(url: repo.avatar_id)
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(10)
                    .padding()
                VStack(alignment: .leading, spacing: 10){
                    Text(repo.fullName)
                        .font(.headline)
                    HStack(){
                        Image(systemName: "star")
                            .foregroundColor(.secondary)
                        Text("\(repo.stargazersCount)")
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
        }
    }
}
