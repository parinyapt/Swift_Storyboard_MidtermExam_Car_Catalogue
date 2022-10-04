//
//  car_catalogue_midterm_049UITestsLaunchTests.swift
//  car_catalogue_midterm_049UITests
//
//  Created by Parinya Termkasipanich on 4/10/2565 BE.
//

import XCTest

final class car_catalogue_midterm_049UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
