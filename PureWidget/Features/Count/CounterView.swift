//
//  CounterView.swift
//  PureWidget
//
//  Created by minoh.park on 10/22/24.
//

import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)
            
            HStack(spacing: 40) {
                Button(action: {
                    viewModel.decrement()
                }) {
                    Text("-")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.red.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
                Button(action: {
                    viewModel.increment()
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.green.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
            }
        }
    }
}
