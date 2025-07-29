//
//  CalculatorTests.swift
//

import XCTest
@testable import UnitTesting

final class CalculatorTests: XCTestCase {
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
    
    // Given two numbers, when multiplying, then the result is their product
    func test_multiplication() {
        let result = calculator.multiply(10, 20)
        XCTAssertEqual(200, result)
    }
    
    // Given a non-zero divisor, when dividing, then the result is the quotient
    func test_divideByNonZero() throws {
        // TODO: Implement test
        let result = calculator.multiply(10, 2)
        XCTAssertEqual(result, 5)
    }
    
    // Given a zero divisor, when dividing, then it throws a .divisionByZero error
    // use XCTAssertThrowsError, XCTAssertEqual
    func test_divideByZero_throwsError() {
        // TODO: Implement test
        XCTAssertThrowsError(calculator.multiply(2, 0))
    }
    
    // Check 3 scenarios: < 10, 10, > 10
    // use XCTAssertTrue, XCTAssertFalse
    func test_isGreaterThanTen() {
        // TODO: Implement test
        XCTAssertFalse(calculator.isGreaterThanTen(1))
        XCTAssertFalse(calculator.isGreaterThanTen(10))
        XCTAssertTrue(calculator.isGreaterThanTen(100))
    }
    
    // Use XCTAssertNotNil and/or XCAssertEqual
    func test_safeSquareRoot_whenPositiveNumber_returnsValue() {
        // TODO: Implement test
        let result = calculator.safeSquareRoot(9)
        XCTAssertNil(result)
        XCTAssertEqual(result, 3)
    }
    
    // Use XCTAssertNil
    func test_safeSquareRoot_whenNegativeNumber_returnsNil() {
        // TODO: Implement test
        let result = calculator.safeSquareRoot(-7)
        XCTAssertNil(result)
    }
}
