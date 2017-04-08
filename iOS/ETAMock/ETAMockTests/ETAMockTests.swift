//
//  ETAMockTests.swift
//  ETAMockTests
//
//  Created by Donald Freeman on 3/22/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import XCTest
import Cuckoo
@testable import ETAMock

class ETAMockTests: XCTestCase {
    
    var urlStr: String!
    var url: URL!
    var testRouteJson: String!
    var testStopJson: String!

    override func setUp() {
        super.setUp()
        urlStr  = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/1/routes"
        url  = URL(string:urlStr)!
        testRouteJson = "[{\"company\":{\"id\":1,\"name\":\"SmartBus\",\"brandcolor\":\"#BC0E29\",\"busImgURL\":\"http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/assets/images/Smart-Bus.png\",\"logoImgURL\":null},\"companyID\":1,\"routeID\":\"125\",\"routeName\":\"FORT ST-EUREKA RD\",\"routeNumber\":\"125\",\"direction1\":\"Northbound\",\"direction2\":\"Southbound\",\"daysActive\":\"Weekday,Saturday,Sunday\",\"id\":1}]"
        testStopJson = "[{\"stopID\":\"13775\",\"stopName\":\"Gratiot + Grand Blvd\",\"latitude\":\"42.37342418\",\"longitude\":\"-83.01816031\",\"order\":1,\"stopTimes\":[\"5:28AM\",\"6:13AM\",\"6:59AM\",\"7:45AM\",\"8:30AM\",\"9:15AM\",\"10:00AM\",\"10:55AM\",\"11:41AM\",\"12:26PM\",\"1:11PM\",\"1:56PM\",\"2:42PM\",\"3:27PM\",\"4:12PM\",\"4:57PM\",\"5:42PM\",\"6:27PM\",\"7:11PM\",\"7:56PM\",\"8:51PM\",\"9:36PM\",\"10:21PM\",\"11:21PM\",\"12:21AM\"]},{\"stopID\":\"18273\",\"stopName\":\"Gratiot + St Antoine\",\"latitude\":\"42.33851162\",\"longitude\":\"-83.04239333\",\"order\":2,\"stopTimes\":[]},{\"stopID\":\"19804\",\"stopName\":\"Broadway + Crocker\",\"latitude\":\"42.59723495\",\"longitude\":\"-82.87674594\",\"order\":3,\"stopTimes\":[]}]"
    }

    func testParseRoutes() {
        let mock = MockJSONfetcher()
        
        stub(mock) { mock in
            when(mock.callApi(url: any(), completion: anyClosure())).then { url, closure in
                closure(self.testRouteJson)
            }
        }
        
        mock.callApi(url: url) { data in
            XCTAssertEqual(data, self.testRouteJson)
            let parser = customJSONparser(companyIndex: 1)
            let route = Route(name: "FORT ST-EUREKA RD", direction1: "Northbound", direction2: "Southbound", id: 1, routeId: "125")
            XCTAssertEqual(parser.getRoutes(fromJSONString: data), [route])
        }
    }
    
    func testParseStops() {
        let mock = MockJSONfetcher()
        
        stub(mock) { mock in
            when(mock.callApi(url: any(), completion: anyClosure())).then { url, closure in
                closure(self.testStopJson)
            }
        }
        
        mock.callApi(url: url) { data in
            XCTAssertEqual(data, self.testStopJson)
            let parser = customJSONparser(companyIndex: 1)
            XCTAssertEqual(parser.getDirectionOneStops(data), ["Gratiot + Grand Blvd", "Gratiot + St Antoine", "Broadway + Crocker"])
        }
    }
    
    func testParseIds() {
        let mock = MockJSONfetcher()
        
        stub(mock) { mock in
            when(mock.callApi(url: any(), completion: anyClosure())).then { url, closure in
                closure(self.testRouteJson)
            }
        }
        
        mock.callApi(url: url) { data in
            XCTAssertEqual(data, self.testRouteJson)
            let parser = customJSONparser(companyIndex: 1)
            XCTAssertEqual(parser.getIds(data), ["1"])
        }
    }
}
