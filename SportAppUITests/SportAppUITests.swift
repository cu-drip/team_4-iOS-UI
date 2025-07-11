import XCTest

final class RegistrationUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        // Установка ориентации устройства в портретную
        let device = XCUIDevice.shared
        if device.orientation != .portrait {
            device.orientation = .portrait
        }

        app = XCUIApplication()
        app.launch()
    }


    func testParticipantParticipantRegistrationFlow() {
        let participantButton = app.buttons["participant"]
        XCTAssertTrue(participantButton.waitForExistence(timeout: 5))
        participantButton.tap()
        
        let registrationButton = app.buttons["registerButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: 5))
        registrationButton.tap()
        
        // Ввод ФИО
        let phioField = app.textFields["phioField"]
        XCTAssertTrue(phioField.waitForExistence(timeout: 5))
        phioField.tap()
        phioField.typeText("Иван Иванов")
        
        // Ввод пароля
        let passwordField = app.secureTextFields["passwordField"]
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5))
        passwordField.tap()
        passwordField.typeText("Password123")
        
        // Ввод подтверждения пароля
        let passwordCheckField = app.secureTextFields["passwordCheckField"]
        XCTAssertTrue(passwordCheckField.waitForExistence(timeout: 5))
        passwordCheckField.tap()
        passwordCheckField.typeText("Password123")
        
        // Нажать кнопку "Зарегистрироваться"
        let submitButton = app.buttons["submitRegistrationButton"]
        XCTAssertTrue(submitButton.waitForExistence(timeout: 5))
        submitButton.tap()
        
    }
    
    func testParticipantAdminRegistrationFlow() {
        let participantButton = app.buttons["admin"]
        XCTAssertTrue(participantButton.waitForExistence(timeout: 5))
        participantButton.tap()
        
        let registrationButton = app.buttons["registerButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: 5))
        registrationButton.tap()
        
        // Ввод ФИО
        let phioField = app.textFields["phioField"]
        XCTAssertTrue(phioField.waitForExistence(timeout: 5))
        phioField.tap()
        phioField.typeText("Иван Иванов")
        
        // Ввод пароля
        let passwordField = app.secureTextFields["passwordField"]
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5))
        passwordField.tap()
        passwordField.typeText("Password123")
        
        // Ввод подтверждения пароля
        let passwordCheckField = app.secureTextFields["passwordCheckField"]
        XCTAssertTrue(passwordCheckField.waitForExistence(timeout: 5))
        passwordCheckField.tap()
        passwordCheckField.typeText("Password123")
        
        // Нажать кнопку "Зарегистрироваться"
        let submitButton = app.buttons["submitRegistrationButton"]
        XCTAssertTrue(submitButton.waitForExistence(timeout: 5))
        submitButton.tap()
        
    }


}
