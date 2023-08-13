//
//  SoalPecahanView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 13/08/23.
//

import SwiftUI

struct soalPecahanView: View{
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


//struct SoalPecahanView_Previews: PreviewProvider {
//    static var previews: some View {
//        let fraction = Binding.constant(FractionPair(f1: Fraction(numerator: 3, denominator: 4), f2: Fraction(numerator: 5, denominator: 8)))
//               soalPecahanView(fraction: fraction, operand: "plus")
//    }
//}
