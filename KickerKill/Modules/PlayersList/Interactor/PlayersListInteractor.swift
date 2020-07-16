// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

final class PlayersListInteractor: PlayersListInteractorInput {

    weak var output: PlayersListInteractorOutput?
    private let webService: WebService

    init(webService: WebService) {
        self.webService = webService
    }

    // MARK: - PlayersListInteractorInput

    func fetchAllPlayers(limit: Int, firstPage: Bool) {

        let params = QueryPlayerService(limit: limit,
                                        firstPage: firstPage,
                                        orderBy: [])
        webService.fetchDocumentsFrom(collectionPath: "players", queryParams: params) { result in
            switch result {
            case .success(let docsData):
                let fetchedPlayerDTOs = docsData.compactMap { FetchPlayerDTO($0) }
                self.output?.didFetchPlayers(fetchedPlayerDTOs.map { Player($0) })
            case .failure(let error):
                self.output?.didFailToFetchPlayers(error)
            }
        }
    }
}
