// Copyright © 4/2/20 Antônio Carlos. All rights reserved.

import Foundation

protocol QueryLimit {
    var limit: Int {get}
    var firstPage: Bool {get}
}
protocol QueryOrder {
    var orderBy: [OrderBy] {get}
}
protocol QueryFilter {
    var filterBy: [FilterBy] {get}
}
protocol FilterBy {
    var field: String {get}
    var value: String {get}
}
protocol OrderBy {
    var field: String {get}
    var descending: Bool {get}
}

typealias PlayerServiceQueryParams = QueryLimit & QueryOrder & QueryFilter

struct QueryPlayerService: PlayerServiceQueryParams {
    let limit: Int
    let firstPage: Bool
    let orderBy: [OrderBy]
    let filterBy: [FilterBy]

    init(limit: Int, firstPage: Bool, orderBy: [OrderBy], filterBy: [FilterBy] = []) {
        self.limit = limit
        self.firstPage = firstPage
        self.orderBy = orderBy
        self.filterBy = filterBy
    }
}
struct QueryPlayerOrderBy: OrderBy {
    let field: String
    let descending: Bool
}
struct QueryPlayerFilterBy: FilterBy {
    let field: String
    let value: String
}
struct QueryFilters: QueryFilter {
    var filterBy: [FilterBy]
}
