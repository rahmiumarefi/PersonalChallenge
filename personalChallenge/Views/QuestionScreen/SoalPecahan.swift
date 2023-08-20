//
//  SoalPecahanView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 13/08/23.
//

import SwiftUI

struct SoalPecahan: View{
    @Binding var fraction:FractionPair
    @Binding var operand:String
    var body: some View{
       
            HStack {
                Spacer()
                VStack{
                    Text("\(fraction.f1.numerator)")
                        .font(.system(size: 36,weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width:40, height:4)
                        .foregroundColor(.white)
                    Text("\(fraction.f1.denominator)")
                        .font(.system(size: 36,weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
                Spacer()
                    .frame(width: 30)
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
                    .frame(width: 30)
                
                VStack{
                    Text("\(fraction.f2.numerator)")
                        .font(.system(size: 36,weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width:40, height:4)
                        .foregroundColor(.white)
                    Text("\(fraction.f2.denominator)")
                        .font(.system(size: 36,weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
                Spacer()
        }
    }
}

struct SoalPecahan_Previews: PreviewProvider {
    static var previews: some View {
        SoalPecahan(fraction: Binding.constant(
            FractionPair(
                f1: (numerator: 3, denominator: 4, decimal: 0.75),
                f2: (numerator: 1, denominator: 2, decimal: 0.5))) , operand: Binding.constant("plus" ) )
    }
}
