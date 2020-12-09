//
//  SearchBar.swift
//  CodeAddictTask
//
//  Created by Jakub Sumionka on 08/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showCancelButton: Bool = false
    @ObservedObject var viewModel: RepositoryListViewModel
    
    var body: some View {
        
        NavigationView {
            ScrollView{
                LazyVStack {
                    SearchBar(text:  $viewModel.text, placeholder: "Search")
                    Button(action: {
                        self.viewModel.search()
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
                   
                
                    HStack(){
                        Text("Repositories")
                            .font(.title)
                            .bold()
                        Spacer()
                        
                    }
                    .padding()
                    VStack() {
                        
                        if viewModel.isLoading {
                            Text("Loading...")
                        } else {
                            viewModel.errorMessage.map(Text.init)?
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                            
                            ForEach(viewModel.repositories) { repository in
                                
                                NavigationLink(destination: CommitView(repo: repository)
                                                
                                              
                                ) {
                                    Repo(repo: repository)
                                }
                            }
                        }
                    }
                    
                    //                List {
                    //                    // Filtered list of names
                    //                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                    //                        searchText in Text(searchText)
                    //                    }
                    //                }
                    .navigationBarTitle(Text("Search"))
                    .resignKeyboardOnDragGesture()
                }
            }
        }
    }
    
}
struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}



//struct ContentView_Previews2: PreviewProvider {
//    static var previews: some View {
//
//        ContentView(viewModel: RepositoryListViewModel)
//
//
//
//    }
//}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
