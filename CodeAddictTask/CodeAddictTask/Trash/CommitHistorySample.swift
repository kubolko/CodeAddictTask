//
//  CommitHistory.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 09/12/2020.
//

import SwiftUI

struct CommitHistory: View {
    let number: String = "1"
    let autor: String = "Commit Autor Name"
    let mail: String = "email@autorname.com"
    let message: String = "This is commit message that needs to be in two lines, ok"
    var body: some View {
        HStack(){
            ZStack(){
                Circle()
                    .fill(Color(.secondarySystemBackground))
                    .frame(width: 36, height: 36)
                 
                Text(number)
            }
            Spacer().frame(width: 20)
            VStack(alignment: .leading, spacing: 4){
                Text(autor)
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
                    
                Text(mail)
                    .multilineTextAlignment(.leading)
                Text(message)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
            }
           
        }
    }
}

struct CommitHistory_Previews: PreviewProvider {
    static var previews: some View {
        CommitHistory()
    }
}
