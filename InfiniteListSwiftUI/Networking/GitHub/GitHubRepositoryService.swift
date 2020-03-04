import Foundation

private func UITesting() -> Bool {
    return ProcessInfo.processInfo.arguments.contains("UI-TESTING")
}

public class GitHubRepositoryService {
    
    private let httpClient: HttpClient

    init(_ httpClient: HttpClient = HttpClient()) {
        self.httpClient = httpClient
    }
    
    func search(page: Int,
                completion: @escaping (HTTPResult<RepositoryResponse, Error>) -> Void) {

        let definition = GitHubRepositoryDefinition.search(page: page)
        
        httpClient.request(endpoint: definition.path,
                           httpMethod: definition.method,
                           completion: completion)
    }

}
