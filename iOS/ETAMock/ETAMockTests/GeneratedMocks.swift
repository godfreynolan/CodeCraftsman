// MARK: - Mocks generated from file: ETAMock/JSONFetcher.swift at 2017-04-07 22:50:59 +0000

//
//  JSONfetcher.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import Cuckoo
@testable import ETAMock

import Foundation

class MockJSONfetcher: JSONfetcher, Cuckoo.Mock {
    typealias MocksType = JSONfetcher
    typealias Stubbing = __StubbingProxy_JSONfetcher
    typealias Verification = __VerificationProxy_JSONfetcher
    let manager = Cuckoo.MockManager()
    
    private var observed: JSONfetcher?
    
    func spy(on victim: JSONfetcher) -> Self {
        observed = victim
        return self
    }
    
    override var url: URL? {
        get {
            return manager.getter("url", original: observed.map { o in return { () -> URL? in o.url } })
        }
        set {
            manager.setter("url", value: newValue, original: observed != nil ? { self.observed?.url = $0 } : nil)
        }
    }
    
    override var apiUrl: String? {
        get {
            return manager.getter("apiUrl", original: observed.map { o in return { () -> String? in o.apiUrl } })
        }
        set {
            manager.setter("apiUrl", value: newValue, original: observed != nil ? { self.observed?.apiUrl = $0 } : nil)
        }
    }
    
    override func getSourceUrl(apiUrl: String) -> URL {
        return manager.call("getSourceUrl(apiUrl: String) -> URL", parameters: (apiUrl), original: observed.map { o in return { (apiUrl: String) -> URL in o.getSourceUrl(apiUrl: apiUrl) } })
    }
    
    override func callApi(url: URL, completion: @escaping (String) -> ()) {
        return manager.call("callApi(url: URL, completion: @escaping (String) -> ())", parameters: (url, completion), original: observed.map { o in return { (url: URL, completion: @escaping (String) -> ()) in o.callApi(url: url, completion: completion) } })
    }
    
    struct __StubbingProxy_JSONfetcher: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var url: Cuckoo.ToBeStubbedProperty<URL?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "url")
        }
        
        var apiUrl: Cuckoo.ToBeStubbedProperty<String?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "apiUrl")
        }
        
        func getSourceUrl<M1: Cuckoo.Matchable>(apiUrl: M1) -> Cuckoo.StubFunction<(String), URL> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: apiUrl) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("getSourceUrl(apiUrl: String) -> URL", parameterMatchers: matchers))
        }
        
        func callApi<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(url: M1, completion: M2) -> Cuckoo.StubNoReturnFunction<(URL, (String) -> ())> where M1.MatchedType == URL, M2.MatchedType == (String) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(URL, (String) -> ())>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("callApi(url: URL, completion: @escaping (String) -> ())", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_JSONfetcher: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var url: Cuckoo.VerifyProperty<URL?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "url", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var apiUrl: Cuckoo.VerifyProperty<String?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "apiUrl", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getSourceUrl<M1: Cuckoo.Matchable>(apiUrl: M1) -> Cuckoo.__DoNotUse<URL> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: apiUrl) { $0 }]
            return manager.verify("getSourceUrl(apiUrl: String) -> URL", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func callApi<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(url: M1, completion: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == URL, M2.MatchedType == (String) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(URL, (String) -> ())>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return manager.verify("callApi(url: URL, completion: @escaping (String) -> ())", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class JSONfetcherStub: JSONfetcher {
    
    override var url: URL? {
        get {
            return DefaultValueRegistry.defaultValue(for: (URL?).self)
        }
        set {
        }
    }
    
    override var apiUrl: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        set {
        }
    }
    
    override func getSourceUrl(apiUrl: String) -> URL {
        return DefaultValueRegistry.defaultValue(for: (URL).self)
    }
    
    override func callApi(url: URL, completion: @escaping (String) -> ()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
