//
//  SignUpViewModel.swift
//  MedBook
//
//  Created by Raj Raval on 12/10/23.
//

import Combine
import Foundation

final class SignUpViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var countryData: [String: CountryData] = [:]
    @Published var selectedCountry: String = ""
    
    @Published var showLogin = false
    
    @Published var isEmailValid = false
    @Published var isPasswordValid = false
    
    @Published var passwordHas8Characters = false
    @Published var passwordHasUppercase = false
    @Published var passwordHasSpecialChracter = false
    
    private var cancellables = Set<AnyCancellable>()
    
    private var passwordValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(passwordCharactersPublisher, passwordUpperPublisher, passwordSpecialPublisher)
            .map { (isLengthValid, hasUpperCase, hasSpecialCharacter) in
                return isLengthValid && hasUpperCase && hasSpecialCharacter
            }
            .eraseToAnyPublisher()
    }
    
    private var emailValidPubisher: AnyPublisher<Bool, Never> {
        $email
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    private var passwordCharactersPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { password in
                let passwordCount = password.count >= 8
                return passwordCount
            }
            .eraseToAnyPublisher()
    }
    
    private var passwordUpperPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { password in
                let passwordHasUpperCase = password.range(of: "[A-Z]", options: .regularExpression) != nil
                return passwordHasUpperCase
            }
            .eraseToAnyPublisher()
    }
    
    private var passwordSpecialPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { password in
                let passwordHasSpecial = password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
                return passwordHasSpecial
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        fetchCountryData()
        
        emailValidPubisher
            .receive(on: RunLoop.main)
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellables)
        passwordValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellables)
        passwordCharactersPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.passwordHas8Characters, on: self)
            .store(in: &cancellables)
        passwordSpecialPublisher
          .receive(on: RunLoop.main)
          .assign(to: \.passwordHasSpecialChracter, on: self)
          .store(in: &cancellables)
        passwordUpperPublisher
          .receive(on: RunLoop.main)
          .assign(to: \.passwordHasUppercase, on: self)
          .store(in: &cancellables)
    }
    
    func signUp() {
        let credentialManager = CredentialsManager()
        do {
            try credentialManager.save(email: email, password: password)
            showLogin = true
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func fetchCountryData() {
        if let response = getResponseFromCache() {
            countryData = response.data
            guard let firstKeyValue = response.data.first else { return }
            selectedCountry = firstKeyValue.key
        } else {
            Task {
                do {
                    let response = try await APIService.shared.fetch(for: .countries) as CountryResponse
                    countryData = response.data
                    guard let firstKeyValue = response.data.first else { return }
                    selectedCountry = firstKeyValue.key
                    saveResponseToCache(response)
                } catch let error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func getResponseFromCache() -> CountryResponse? {
        if let cachedData = UserDefaults.standard.data(for: .countryResponse) {
            do {
                let decodedData = try JSONDecoder().decode(CountryResponse.self, from: cachedData)
                return decodedData
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    private func saveResponseToCache(_ response: CountryResponse) {
        do {
            let encodedResponse = try JSONEncoder().encode(response)
            UserDefaults.standard.set(encodedResponse, for: .countryResponse)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
