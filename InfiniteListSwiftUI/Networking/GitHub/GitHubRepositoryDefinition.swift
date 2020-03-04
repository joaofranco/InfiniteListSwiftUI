import Foundation

public enum GitHubRepositoryDefinition {
    case search(page: Int)
}

extension GitHubRepositoryDefinition {
    public var path: String {
        switch self {
        case .search(let page):
            return "https://api.github.com/search/repositories?q=language:swift&sort=stars&page=\(page)"
        }
    }
    public var method: HttpMethod {
        return HttpMethod.get
    }
}
