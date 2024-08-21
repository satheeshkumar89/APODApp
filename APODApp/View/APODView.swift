//
//  APODView.swift
//  APODApp
//
//  Created by APPLE on 20/08/24.
//

import SwiftUI

struct APODView: View {
    @ObservedObject var viewModel = APODViewModel()

    var body: some View {
        VStack {
            if let apod = viewModel.apod {
                AsyncImage(url: URL(string: apod.url)) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: .infinity, maxHeight: .infinity)
                } placeholder: {
                    ProgressView()
                }
                Text(apod.title)
                    .font(.headline)
                    .padding()
                Text(apod.explanation)
                    .font(.body)
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else {
                Text("Loading...")
                    .padding()
                    .onAppear {
                        viewModel.loadAPODFromLocal()
                        viewModel.fetchAPOD()
                    }
            }
        }
        .navigationBarTitle("Astronomy Picture of the Day", displayMode: .inline)
    }
}
