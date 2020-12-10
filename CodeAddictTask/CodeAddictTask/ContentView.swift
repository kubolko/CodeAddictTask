//
//  SearchBar.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 08/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var viewModel: RepositoryListViewModel
    @State var isSearching = false
    
    var body: some View {
        
        NavigationView {
            ScrollView{
            VStack {
                    //Search Field
                    HStack{
                        HStack {
                            TextField("Search", text: $viewModel.text.bound
                                      ,onCommit: {
                                        self.viewModel.search()
                                      })
                               
                                .padding(.leading, 32)
                        } .frame(height: 36 )
//                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(6)
                        .padding(.horizontal)
                        .onTapGesture(perform: {
                            isSearching = true
                        })
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                
                                if isSearching {
                                    Button(action: { viewModel.text.bound = "" }, label: {
                                        Image(systemName: "xmark.circle.fill")
                                            .padding(.vertical)
                                    })
                                    
                                }
                                
                            }.padding(.horizontal, 32)
                            .foregroundColor(.gray)
                        ).transition(.move(edge: .trailing))
                        .animation(.spring())
                        
                        if isSearching {
                            Button(action: {
                                isSearching = false
                                viewModel.text.bound = ""
                                
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                
                            }, label: {
                                Text("Cancel")
                                    .padding(.trailing)
                                    .padding(.leading, 0)
                            })
                            .transition(.move(edge: .trailing))
                            .animation(.spring())
                        }
                        
                    }
                   
                    .cornerRadius(10)
                   
                    
                    HStack(){
                        Text("Repositories")
                            .font(.title)
                            .bold()
                        Spacer()
                        
                    }
                    .padding()
                 
                        if viewModel.isLoading {
                            Text("Loading...")
                        } else {
                            viewModel.errorMessage.map(Text.init)?
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                            
                            ForEach(viewModel.repositories) { repository in
                                
                                NavigationLink(destination:
                                                CommitViewSample()
                                ) {
                                    
                                    Repo(repo: repository)
                                }.navigationBarTitle(Text("Search"))
                            }
                        }
                    }
                    
                    .navigationBarTitle(Text("Search"))
                    
                }
            }
        }
    }
    

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}







