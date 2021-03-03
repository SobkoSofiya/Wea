//
//  Swift2.swift
//  Weather
//
//  Created by Sofi on 17.02.2021.
//

import SwiftUI

struct Swift2: View {
    @State var Swift22 = 1
    var body: some View {
        if Swift22 == 1{
            Main( Swift22: $Swift22)
        } else if Swift22 == 2{
            WeatherDetail(Swift22: $Swift22)
        }
        else if Swift22 == 3{
           ViewMap(Swift22: $Swift22)
       }
        
    }
}

struct Swift2_Previews: PreviewProvider {
    static var previews: some View {
        Swift2()
    }
}
