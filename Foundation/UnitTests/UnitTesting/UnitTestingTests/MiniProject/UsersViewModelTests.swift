``````//
//  UsersViewModelTests.swift
//  UnitTesting
//

@testable import UnitTesting
import XCTest

class UsersViewModelTests: XCTestCase {
    var mockService: MockAPIService!
    
    override func setUp() {
        super.setUp()
        mockService = MockAPIService()
    }
    
    override func tearDown() {
        mockService = nil
        super.tearDown()
    }
    
    // assert that sut.fetchUsers(completion: {}) calls appropriate method of api service
    // use XCAssertEqual, fetchUsersCallsCount
    func test_viewModel_whenFetchUsers_callsApiService() {
        let sut = makeSut()
        // TODO: Implement test
        let expectation = expectation(description: "api")
        
        sut.fetchUsers {
            XCTAssertEqual(self.mockService.fetchUsersCallsCount, 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // assert that the passed url to api service is correct
    func test_viewModel_whenFetchUsers_passesCorrectUrlToApiService() {
        // TODO: Implement test
    }
    
    // assert that view model users are updated and error message is nil
    func test_viewModel_fetchUsers_whenSuccess_updatesUsers() {
        mockService.fetchUsersResult = .success(
            [User(id: 1, name: "name", username: "surname", email: "user@email.com")]
        )
        let sut = makeSut()
        
        // TODO: Implement test
        let expectation = expectation(description: "success ")
        
        sut.fetchUsers {
            XCTAssertEqual(sut.users.count, 1)
            XCTAssertEqual(sut.users.first?.name, "name")
            XCTAssertNil(sut.errorMessage)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // assert that view model error message is "Unexpected error"
    func test_viewModel_fetchUsers_whenInvalidUrl_updatesErrorMessage() {
        // TODO: Implement test
        mockService.fetchUsersResult = .failure(.invalidUrl)
        var sut = makeSut()
        let expectation = expectation(description: "url")
        
        sut.fetchUsers {
            XCTAssertEqual(sut.errorMessage, "Unexpected error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // assert that view model error message is "Unexpected error"
    func test_viewModel_fetchUsers_whenUnexectedFailure_updatesErrorMessage() {
        // TODO: Implement test
        mockService.fetchUsersResult = .failure(.unexpected)
        var sut = makeSut()
        let expectation = expectation(description: "error")
        
        sut.fetchUsers {
            XCTAssertEqual(sut.errorMessage, "Unexpected error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // assert that view model error message is "Error parsing JSON"
    func test_viewModel_fetchUsers_whenParsingFailure_updatesErrorMessage() {
        // TODO: Implement test
        mockService.fetchUsersResult = .failure(.parsingError)
        var suut = makeSut()
        let expectation = expectation(description: "pars error")
        
        suut.fetchUsers {
            XCTAssertEqual(suut.errorMessage, "Error parsing JSON")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // fetch users with successful result and after calling clear() assert users are empty
    func test_viewModel_clearUsers() {
        // TODO: Implement test
        mockService.fetchUsersResult = .success([User(id: 1, name: "ыгкут", username: "sere", email: "adf@asdfasd.asdf")])
        var sut = makeSut()
        
        let expectation = expectation(description: "сlear")
        
        sut.fetchUsers {
            XCTAssertFalse(sut.users.isEmpty)
            sut.clearUsers()
            XCTAssertTrue(sut.users.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    private func makeSut() -> UsersViewModel {
        UsersViewModel(apiService: mockService)
    }
}
``````
