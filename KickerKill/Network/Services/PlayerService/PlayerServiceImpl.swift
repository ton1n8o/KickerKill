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
            documentData = try playerDTO.toDictionary()
        } catch let error {
            completion(.failure(error))
            return
        }

        webService.createDocument(documentData, intoCollection: Collections.players) { result in
            completion(result)
        }
    }

    func createOrUpdate(_ playerDTO: CreatePlayerDTO, completion: @escaping (Error?) -> Void) {

        let documentData: [String: Any]
        do {
            documentData = try playerDTO.toDictionary()
        } catch let error {
            completion(error)
            return
        }

        let path = "\(Collections.players)/\(playerDTO.firestoreUID)"
        webService.createOrUpdate(document: documentData, documentPath: path) { error in
            completion(error)
        }
    }

    func fetchPlayerWith(firestoreUID: String, completion: @escaping (Result<FetchPlayerDTO?, Error>) -> Void) {

        webService.fetchDocument(firestoreUID: firestoreUID,
                                 from: Collections.players) { result in

                                    switch result {
                                    case .success(let document):

                                        let fetchPlayerDTO = document == nil ? nil : FetchPlayerDTO(document!)
                                        completion(.success(fetchPlayerDTO))
                                    case .failure(let error):
                                        completion(.failure(error))
                                    }
        }
    }
}
