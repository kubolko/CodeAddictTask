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
                LazyVStack {
                    //Search Field
                    HStack{
                        HStack {
                            TextField("Search terms here", text: $viewModel.text.bound
                                      ,onCommit: {
                                        self.viewModel.search()
                                      })
                                .padding(.leading, 24)
                        }
                        .padding()
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
                    Button<Text>(LocalizedStringKey("Search")) { self.viewModel.search() }
                        .frame(height: 40)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .border(Color.blue)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                    
                    HStack(){
                        Text("Repositories")
                            .font(.title)
                            .bold()
                        Spacer()
                        
                    }
                    .padding()
                    List{
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
                                }
                            }
                        }
                    }
                    //                    List {
                    //                        if viewModel.isLoading {
                    //                            Text("Loading...")
                    //                        } else {
                    //                            viewModel.errorMessage.map(Text.init)?
                    //                                .lineLimit(nil)
                    //                                .multilineTextAlignment(.center)
                    //
                    //
                    //                            ForEach(viewModel.repositories) { repository in
                    //
                    //                                NavigationLink(destination: CommitView(repo: repository)
                    //
                    //
                    //                                ) {
                    //                                    Repo(repo: repository)
                    //                                }
                    //                            }
                    //                        }
                    //                    }
                    
                    //                List {
                    //                    // Filtered list of names
                    //                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                    //                        searchText in Text(searchText)
                    //                    }
                    //                }
                    .navigationBarTitle(Text("Search"))
                    
                }
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







