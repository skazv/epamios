//
//  APIServiceTests.swift
//  UnitTesting
//

import XCTest
@testable import UnitTesting

final class APIServiceTests: XCTestCase {
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
    }
    
    override func tearDown() {
        mockURLSession = nil
        super.tearDown()
    }
    
    // MARK: Fetch Users
    
    // pass some invalid url and assert that method completes with .failure(.invalidUrl)
    // use expectations
    func test_apiService_fetchUsers_whenInvalidUrl_completesWithError() {
        // TODO: Implement test
        var sut: APIService = makeSut()
        let expectation = self.expectation(description: "url")
        
        sut.fetchUsers(urlString: "asdfasdf") { resulr in
            if case .failure(let error) = resulr {
                XCTAssertEqual(error, .invalidUrl)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    // assert that method completes with .success(expectedUsers)
    func test_apiService_fetchUsers_whenValidSuccessfulResponse_completesWithSuccess() {
        let response = """
        [
            { "id": 1, "name": "John Doe", "username": "johndoe", "email": "johndoe@gmail.com" },
            { "id": 2, "name": "Jane Doe", "username": "johndoe", "email": "johndoe@gmail.com" }
        ]
        """.data(using: .utf8)
        mockURLSession.mockData = response
        
        let sut = makeSut()
        
        // TODO: Implement test
        let expectation = self.expectation(description: "success")
        sut.fetchUsers(urlString: "чсмичсмичс.com") { result in
            if case .success(let users) = result {
                XCTAssertEqual(users.count, 2)
                XCTAssertEqual(users[0].name, "Suren")
            } else {
                XCTFail("Expected successful response")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // assert that method completes with .failure(.parsingError)
    func test_apiService_fetchUsers_whenInvalidSuccessfulResponse_completesWithFailure() {
        // TODO: Implement test
        let invalidJSON = """
          { "lol": "lolololololo" }
          """.data(using: .utf8)
        
        mockURLSession.mockData = invalidJSON
        var sut = makeSut()
        let expectation = self.expectation(description: "pars error")
        
        sut.fetchUsers(urlString: "https://asfasdfasdacsdc.com") { result in
            if case .failure(let error) = result {
                XCTAssertEqual(error, .parsingError)
            } else {
                XCTFail("Expected parsingError")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // assert that method completes with .failure(.unexpected)
    func test_apiService_fetchUsers_whenError_completesWithFailure() {
        // TODO: Implement test
        mockURLSession.mockError = NSError(domain: "", code: -1)
        var sut = makeSut()
        let expectation = self.expectation(description: "error")
        
        sut.fetchUsers(urlString: "https://sdfgsdfvscv.com") { result in
            if case .failure(let error) = result {
                XCTAssertEqual(error, .unexpected)
            } else {
                XCTFail("Expected unexpected error")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // MARK: Fetch Users Async
    
    // pass some invalid url and assert that method completes with .failure(.invalidUrl)
    func test_apiService_fetchUsersAsync_whenInvalidUrl_completesWithError() async {
        // TODO: Implement test
        var sut = makeSut()
        let result = await sut.fetchUsersAsync(urlString: "invalid")
        
        if case .failure(let error) = result {
            XCTAssertEqual(error, .invalidUrl)
        } else {
            XCTFail("Expected invalidUrl error")
        }
    }
    
    // TODO: Implement test
    // add other tests for fetchUsersAsync
    
    private func makeSut() -> APIService {
        APIService(urlSession: mockURLSession)
    }
}
