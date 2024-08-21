//
//  APODViewModel.swift
//  APODApp
//
//  Created by APPLE on 20/08/24.
//

import Foundation
import Combine

class APODViewModel: ObservableObject {
    @Published var apod: APODModel?
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let apiKey = "N76fLGM1s0dmXW9E8biZOTbJSoiXW2YSivLkt9zc"
    private let baseURL = "https://api.nasa.gov/planetary/apod"

    func fetchAPOD() {
        
        print("xasdajdka = \(baseURL)?api_key=\(apiKey)")
        guard let url = URL(string: "\(baseURL)?api_key=\(apiKey)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: APODModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { apod in
                self.apod = apod
                self.saveAPODToLocal(apod)
            })
            .store(in: &self.cancellables)
    }

    private func saveAPODToLocal(_ apod: APODModel) {
          if let encoded = try? JSONEncoder().encode(apod) {
              UserDefaults.standard.set(encoded, forKey: "cachedAPOD")
          }
    }

    func loadAPODFromLocal() {
        if let savedAPOD = UserDefaults.standard.object(forKey: "cachedAPOD") as? Data {
            if let loadedAPOD = try? JSONDecoder().decode(APODModel.self, from: savedAPOD) {
                self.apod = loadedAPOD
            }
        }
    }
}
