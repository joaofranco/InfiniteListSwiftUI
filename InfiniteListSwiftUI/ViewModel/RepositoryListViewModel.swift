import Foundation
import SwiftUI

class RepositoryListViewModel: ObservableObject {
    @Published var statusMessage: String
    @Published var items: [Repository]
    var isLoading = false
    let gapToSearchMore = 3
    var page = 0
    var service: GitHubRepositoryService
    
    init(_ service: GitHubRepositoryService = GitHubRepositoryService()) {
        self.service = service
        self.items = [Repository]()
        statusMessage = ""
        fetchRepos()
    }
    
    private func fetchRepos() {
        self.statusMessage = "Loading"
        self.page = self.page + 1
        self.isLoading = true
        
        service.search(page: page) { (result) in
                switch result {
                case .success(let response):
                    self.isLoading = false
                    DispatchQueue.main.async {
                        self.statusMessage = ""
                        self.items.append(contentsOf: response.items)
                    }
                case .error(_):
                    self.statusMessage = "End"
                }
        }
    }
    
    func continuePagination(item: Repository) {
        if let i = items.firstIndex(where: { $0.id == item.id }) {
            let nearToEnd = (items.count - i) <= gapToSearchMore
            if nearToEnd && !isLoading {
                fetchRepos()
            }
        }
    }
}
