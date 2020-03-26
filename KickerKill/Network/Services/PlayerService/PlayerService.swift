// Copyright © 2/20/20 Antônio Carlos. All rights reserved.

import Foundation

protocol PlayerService {

    func createPlayer(_ playerDTO: CreatePlayerDTO,
                      completion: @escaping (Result<Void, Error>) -> Void)

    func createOrUpdate(_ playerDTO: CreatePlayerDTO,
                        completion: @escaping (Error?) -> Void)

    func fetchPlayerWith(firestoreUID: String,
                         completion: @escaping (Result<FetchPlayerDTO?, Error>) -> Void)
}
