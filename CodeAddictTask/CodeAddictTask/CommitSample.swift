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
    let Score: Int = 420

    var body: some View{
        ZStack(){
            Rectangle()
                .fill(Color(UIColor.lightGray))
                .frame(width: 343, height: 92)
                .cornerRadius(13)
               
            HStack(){
                Image(Imagee)
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(10)
                    .padding()
                VStack(alignment: .leading, spacing: 10){
                    Text(Name)
                    HStack(){
                        Image(systemName: "star")
                        
                    }
                }
                Spacer()
            }
        }
    }
}

