//
//  CredentialsManager.swift
//  MedBook
//
//  Created by Raj Raval on 12/10/23.
//

import Foundation
import KeychainAccess

final class CredentialsManager {

    private let keychain: Keychain
    private let emailKey = "com.rajraval.medbook.email"
    private let passwordKey = "com.rajraval.medbook.password"

    init(service: String = "com.rajraval.medbook") {
        keychain = Keychain(service: service)
    }

    func save(email: String, password: String) throws {
        try keychain.synchronizable(true).set(email, key: emailKey)
        try keychain.synchronizable(true).set(password, key: passwordKey)
    }

    func getEmail() throws -> String? {
        return try keychain.synchronizable(true).get(emailKey)
    }

    func getPassword() throws -> String? {
        return try keychain.synchronizable(true).get(passwordKey)
    }

    func deleteCredentials() throws {
        try keychain.synchronizable(true).remove(emailKey)
        try keychain.synchronizable(true).remove(passwordKey)
    }
}
