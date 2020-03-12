// Copyright © 3/12/20 Antônio Carlos. All rights reserved.

import XCTest
@testable import KickerKill

final class PlayerServiceImplTests: XCTestCase {

    var sut: PlayerServiceImpl!
    var webService: MockWebService!

    override func setUp() {
        super.setUp()
        webService = MockWebService()
        sut = PlayerServiceImpl(webService: webService)
    }

    override func tearDown() {
        sut = nil
        webService = nil
        super.tearDown()
    }

    func test_CreateOrUpdate_Success() {

        // Arrange
        let player = Player(id: "Id_xxx", name: "foo", email: "email@email.com")
        let createPlayerDTO = CreatePlayerDTO(player: player)
        let expectedDocumentPath = "players/\(player.id)"

        webService.resultCreateOrUpdate = .success(())

        let ex = expectation(description: "createOrUpdate should succeed")
        ex.expectedFulfillmentCount = 1

        // Act
        sut.createOrUpdate(createPlayerDTO) { result in
            switch result {
            case .success(()):
                ex.fulfill()
            case .failure(let error):
                XCTFail("CreateOrUpdate failed but it should succeeded: \(error.localizedDescription)")
            }
        }

        // Assert
        waitForExpectations(timeout: 5)

        if case .createOrUpdate(let dictionary, let documentPath) = webService.invocations.first {
            XCTAssertEqual(dictionary.count, 3)
            XCTAssertEqual(dictionary["firestoreUID"] as? String, "Id_xxx")
            XCTAssertEqual(dictionary["name"] as? String, "foo")
            XCTAssertEqual(dictionary["email"] as? String, "email@email.com")
            XCTAssertEqual(expectedDocumentPath, documentPath)
        }
    }

    func test_CreateOrUpdate_Failure() {

        // Arrange
        let player = Player(id: "Id_xxx", name: "foo", email: "email@email.com")
        let createPlayerDTO = CreatePlayerDTO(player: player)

        let userInfo = [NSLocalizedDescriptionKey: "error description"]
        let expectedError = NSError(domain: "0", code: 0, userInfo: userInfo)

        webService.resultCreateOrUpdate = .failure(expectedError)

        let ex = expectation(description: "createOrUpdate should fail")
        ex.expectedFulfillmentCount = 1

        // Act
        sut.createOrUpdate(createPlayerDTO) { result in
            switch result {
            case .success(()):
                XCTFail("createOrUpdate succeeded but should fail")
            case .failure(let error):
                self.assertEqual(expectedError, error)
                ex.fulfill()
            }
        }

        // Assert
        waitForExpectations(timeout: 5)
    }
}
