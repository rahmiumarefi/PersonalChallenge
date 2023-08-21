//
//  SoalGambarView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 13/08/23.
//

import SwiftUI

struct SoalGambar: View {
    @Binding var fraction:FractionPair
    @Binding var operand:String
    var body: some View{
        ZStack{
           
            HStack {
                Spacer()
                FractionShape(numerator: fraction.f1.numerator, denominator: fraction.f1.denominator)
                
                Spacer()
                
                if(operand == "plus"){
                    Image(systemName: operand)
                        .resizable()
                        .frame(width:30, height:30)
                        .foregroundColor(.white)
                }
                else{
                    Image(systemName: operand)
                        .resizable()
                        .frame(width:30, height:2)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                FractionShape(numerator: fraction.f2.numerator, denominator: fraction.f2.denominator)
                Spacer()
            }
        }
    }
}

struct SoalGambar_Previews: PreviewProvider {
    static var previews: some View {
        SoalGambar(fraction:Binding.constant(
            FractionPair(
                f1: (numerator: 3, denominator: 4, decimal: 0.75),
                f2: (numerator: 1, denominator: 2, decimal: 0.5))) , operand: Binding.constant("plus" ) )
    }
}
