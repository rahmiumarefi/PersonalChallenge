//
//  ModeSoal.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 11/08/23.
//

import SwiftUI

struct ModeSoal: View {
    @Binding var vibrate:Bool
    var title:String
    @Binding var setting:QuestionType
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size:18))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(10)
            Spacer()
            
            Toggle(isOn: $vibrate) {
                
            }
            .onChange(of: vibrate){newValue in
                if !newValue{
//                    print("masuk atas")
                    if !setting.isGambar && !setting.isBilangan && !setting.isCerita{
//                        print("masuk sini")
                        vibrate = true
                    }
                }
            }
            .frame(maxWidth: 50)
            .padding(10)
            
            
        }
        .frame(maxWidth: 327, maxHeight: 68)
        .background(Color("PurpleLight"))
        .cornerRadius(20)
        .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
        .padding(.bottom,40)
    }
}


struct ModeSoal_Previews: PreviewProvider {
    static var previews: some View {
        ModeSoal(vibrate: Binding.constant(false), title: " ", setting: .constant(QuestionType(isBilangan: true,isCerita: false,isGambar: false)))
    }
}
