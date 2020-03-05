// Copyright © 2/20/20 Antônio Carlos. All rights reserved.

import Foundation

final class PlayerServiceImpl: PlayerService {

    private enum Collections {
        static let players = "players"
    }

    private let webService: WebService

    init(webService: WebService) {
        self.webService = webService
    }

    func createPlayer(_ playerDTO: CreatePlayerDTO, completion: @escaping (Result<Void, Error>) -> Void) {

        let documentData: [String: Any]
        do {
            let data = try JSONEncoder().encode(playerDTO)
            documentData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
        } catch let error {
            print("Failed to encode reservation details during reservation update: \(error)")
            completion(.failure(error))
            return
        }

        webService.createDocument(documentData, intoCollection: Collections.players) { result in
            completion(result)
        }
    }
}
