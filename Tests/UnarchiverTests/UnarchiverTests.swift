import XCTest
import Unarchiver

final class UnarchiverTests: XCTestCase {
    func testZipUZip() {
        
        let value = "That is my test raw string, really big big long long long string. That is my test raw string, really big big long long long string. That is my test raw string, really big big long long long string. That is my test raw string, really big big long long long string. That is my test raw string, really big big long long long string. That is my test raw string, really big big long long long string."
        
        guard let clearData = value.data(using: .utf8) else { XCTFail(); return }
        do {
            let zippedData = try clearData.gzipped(level: CompressionLevel.bestSpeed)
            let zippedSize = zippedData.count
            
            guard clearData.count > zippedSize else {
                XCTFail("Zipped size should be smaller.")
                return
            }
            
            let uzipperData = try zippedData.gunzipped()
            
            guard uzipperData.count == clearData.count else {
                XCTFail("Zipped size should be equal unzipped.")
                return
            }
            
            let unzippedValue = String(data: uzipperData, encoding: .utf8)
            
            guard value == unzippedValue else {
                XCTFail("Unzipped value should be equal value.")
                return
            }
            
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    static var allTests = [
        ("testZipUZip", testZipUZip),
    ]
}
