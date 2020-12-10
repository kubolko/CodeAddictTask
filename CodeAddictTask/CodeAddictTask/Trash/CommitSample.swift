//
//  CommitView.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 08/12/2020.
//

import SwiftUI

struct CommitSample : View {
    let Name: String = "Repo Title"
    let Imagee: String = "Sample"
    let Score: String = "420"

    var body: some View{
        ZStack(){
            Rectangle()
                .fill(Color(.secondarySystemBackground))
                .frame(width: 343, height: 92)
                .cornerRadius(13)
               
            HStack(){
                Spacer()
                    .frame(width: 16)
                Image(Imagee)
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(10)
                    .padding()
                VStack(alignment: .leading, spacing: 10){
                    Text(Name)
                        .font(.headline)
                    HStack(){
                        Image(systemName: "star")
                            .foregroundColor(.secondary)
                        Text(Score)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
        }
    }
}

