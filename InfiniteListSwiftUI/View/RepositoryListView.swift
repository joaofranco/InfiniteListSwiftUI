import SwiftUI

struct RepositoryListView: View {
    @ObservedObject var viewModel = RepositoryListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(viewModel.items) { item in
                        Text(item.fullName)
                            .padding()
                            .onAppear {
                                self.viewModel.continuePagination(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Repository Infinite SwiftUI"), displayMode: .inline)
            .navigationBarItems(trailing:
                        VStack {
                            Text(viewModel.statusMessage)
            })
        }
    }
}
