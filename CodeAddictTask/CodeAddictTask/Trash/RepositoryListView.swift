////
////  RepositoryListView.swift
////  GitHubSearchWithSwiftUI
////
////  Created by marty-suzuki on 2019/06/05.
////  Copyright © 2019 jp.marty-suzuki. All rights reserved.
////
//
//import SwiftUI
//
//
//struct ContentView : View {
//
//    @ObservedObject var viewModel: RepositoryListViewModel
//    @State var isSearching = false
//    
//    var body: some View {
//
//        NavigationView {
//
//            VStack {
//
//                VStack {
//                    HStack{
//                        
//                            HStack {
//                                TextField("Search terms here", text: $viewModel.text.bound
//                                          ,onCommit: {
//                                            self.viewModel.search()
//                                        })
//                                    .padding(.leading, 24)
//                            }
//                            .padding()
//                            .background(Color(.systemGray5))
//                            .cornerRadius(6)
//                            .padding(.horizontal)
//                            .onTapGesture(perform: {
//                                isSearching = true
//                            })
//                            .overlay(
//                                HStack {
//                                    Image(systemName: "magnifyingglass")
//                                    Spacer()
//                                    
//                                    if isSearching {
//                                        Button(action: { viewModel.text.bound = "" }, label: {
//                                            Image(systemName: "xmark.circle.fill")
//                                                .padding(.vertical)
//                                        })
//                                        
//                                    }
//                                    
//                                }.padding(.horizontal, 32)
//                                .foregroundColor(.gray)
//                            ).transition(.move(edge: .trailing))
//                            .animation(.spring())
//                            
//                            if isSearching {
//                                Button(action: {
//                                    isSearching = false
//                                    viewModel.text.bound = ""
//                                    
//                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                                    
//                                }, label: {
//                                    Text("Cancel")
//                                        .padding(.trailing)
//                                        .padding(.leading, 0)
//                                })
//                                .transition(.move(edge: .trailing))
//                                .animation(.spring())
//                            }
//                            
//                        }
//                    
//
//
//                    Button<Text>(LocalizedStringKey("Search")) { self.viewModel.search() }
//                        .frame(height: 40)
//                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
//                        .border(Color.blue)
//                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
//                    
//                          Button(action: {
//                            self.viewModel.search()
//                          }) {
//                              ZStack{
//                                  Rectangle()
//                                      .fill(Color(.secondarySystemBackground))
//                                      .frame( height: 50)
//                                      .cornerRadius(10)
//                                      .padding(.horizontal)
//                                  HStack(){
//                                      Image(systemName: "share")
//                                          .foregroundColor(Color.blue)
//                                      Text("Share Repo")
//                                          .foregroundColor(Color.blue)
//                                      
//                                  }
//                                  
//                              }
//                          }
//                }
//
//                ScrollView{
//                    if viewModel.isLoading {
//                        Text("Loading...")
//                    } else {
//                        viewModel.errorMessage.map(Text.init)?
//                            .lineLimit(nil)
//                            .multilineTextAlignment(.center)
//
//                        ForEach(viewModel.repositories) { repository in
//
//                            NavigationLink(destination:
//                                WebView(url: repository.htmlUrl)
//                                    .navigationBarTitle(Text(repository.fullName))
//                            ) {
//
//                                Repo(repo: repository)
//                            }
//                        }
//                    }
//                }
//                .navigationBarTitle(Text("Search🔍"))
//            }
//        }
//    }
//    
//}
//
