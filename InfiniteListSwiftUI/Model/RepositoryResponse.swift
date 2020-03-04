import Foundation

// MARK: - RepositoryResponse
struct RepositoryResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Repository: Codable, Identifiable {
    let id: Int
    let name, fullName: String
    let itemPrivate: Bool
    let owner: Owner
    let htmlURL: String
    let itemDescription: String
    let url: String
    let createdAt, updatedAt: String
    let homepage: String?
    let size, stargazersCount, watchersCount: Int
    let language: String
    let forksCount: Int
    let archived, disabled: Bool
    let openIssuesCount: Int
    let license: License?
    let score: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case itemDescription = "description"
        case url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case forksCount = "forks_count"
        case archived, disabled
        case openIssuesCount = "open_issues_count"
        case license, score
    }
}

// MARK: - License
struct License: Codable {
    let name: String
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let id: Int
    let avatarURL, url: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case url
    }
}
