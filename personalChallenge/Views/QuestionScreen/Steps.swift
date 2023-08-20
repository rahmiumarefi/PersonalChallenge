//
//  Steps.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 15/08/23.
//

import SwiftUI

struct Steps: View {
    var title:String
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
                    .padding(.vertical, 8)
                    .padding(.leading, 40)
                Spacer()
            }
            .frame(maxWidth:.infinity)
            .background(Color("PurpleSteps"))
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .frame(maxWidth: 24)
                    .foregroundColor(Color ("PurpleLight")), alignment: .leading
            )
            .cornerRadius(9)
        } .padding(.bottom, 12)
    }
}

struct Steps_Previews: PreviewProvider {
    static var previews: some View {
        Steps(title: " ")
    }
}
