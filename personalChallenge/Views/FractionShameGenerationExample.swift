//
//  FractionShameGenerationExample.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 17/08/23.
//

import SwiftUI

struct FractionShapeGenerationExample: View {
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    FractionShape(numerator: 2, denominator: 8)
                    
                    Spacer()
                    
                    Text("+").font(.largeTitle)
                    
                    Spacer()
                    
                    FractionShape(numerator: 1, denominator: 10)
                }
                
                Spacer()
                
                
            }
            .navigationTitle("Fraction Problem")
            .padding([.horizontal], 12)
        }
    }
}

struct FractionShapeGenerationExample_Previews: PreviewProvider {
    static var previews: some View {
        FractionShapeGenerationExample()
    }
}

