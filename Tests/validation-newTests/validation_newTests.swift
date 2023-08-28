

import XCTest
@testable import validation_new

final class validation_newTests: XCTestCase {

        func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DummyPackage().text, "Hello, World!")
    }

    var calculator: validation_new!

    override func setUp() {
        calculator = validation_new()
    }
}
// final class validation_newTests: XCTestCase {
// var dd = validation_new()
//    // var view1 = View()
//       override func setUp() {
//         dd = validation_new()
//     }

//   func  test_validateemail_true() {
      
//       let email = dd.isValidEmail("q@g.com")
//       XCTAssertTrue(email)
//     }
    
//     func test_validateemail_false() {
//         let email = dd.isValidEmail("qom")
//         XCTAssertFalse(email)
//       }
    
//     func  test_validatphone_true(){
//         let phoneno = dd.isValiphoneNumber("0123456789")
//         XCTAssertTrue(phoneno)
//       }
      
//       func test_validatphone_false() {
//           let phoneno = dd.isValiphoneNumber("123")
//           XCTAssertFalse(phoneno)
//         }
    
//     func test_limitUsername_true() {
//         let name = dd.limitUserName(name1: "12345678901234567890123456789")
//         XCTAssertLessThanOrEqual(name.count, 16)
//     }
    
//     func test_limitphoneno() {
//         let phoneNumber = dd.limitPhoneNo(phoneNumber1: "1234567890112121")
//         XCTAssertEqual(phoneNumber.count, 10)
//     }
    
//     func test_limitpincode() {
//         let pincode = dd.limitPincode(pincode1: "1234567")
//         XCTAssertEqual(pincode.count, 6)
//     }
    
    
//     func test_validate_Name() {
//         let name = dd.Validation(name: "", pincode: "111111", phoneNumber: "1234567890", email: "a@b.com")
//         XCTAssertEqual(name,"Enter Correct UserName")
//     }
    
//     func test_validate_Pincode() {
//         let PINCODE = dd.Validation(name: "test", pincode: "1234567", phoneNumber: "1234567890", email: "test@b.com")
//          XCTAssertEqual(PINCODE,"Enter Correct PINCODE")
//     }
    
//     func test_validate_Email() {
//         let email = dd.Validation(name: "test", pincode: "1234567", phoneNumber: "1234567890", email: "test")
//          XCTAssertEqual(email,"Enter Correct Email")
//     }
    
//     func test_validate_phoneno() {
//         let phonno = dd.Validation(name: "test", pincode: "1234567", phoneNumber: "123456", email: "test")
//          XCTAssertEqual(phonno,"Enter correct phone number")
//     }
    
//     func test_validate() {
//         let phonno = dd.Validation(name: "test", pincode: "123467", phoneNumber: "1234567890", email: "test@gmail.com")
//          XCTAssertEqual(phonno,"Form Submitted Successfully")
//     }

// }

