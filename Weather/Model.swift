//
//  Model.swift
//  Weather
//
//  Created by Sofi on 17.02.2021.
//

import Foundation
import SwiftUI


struct Model:Hashable {
    var city, tempNow, date, wind, hum, tempCurr,time15, weath,tempCurr2,time152,tempCurr3,time153 :String
}



struct ModelFirstDay1:Hashable {
    var city, temp, wind, hum, text:String
}
struct ModelFirstDay:Hashable {
    var city, temp, tempcur:String
}


struct ModelFirstDayDetail:Hashable {
    var city, temp:String
}


struct ModelSecondDayDetail:Hashable {
    var city, temp:String
}

struct ModelThirdDayDetail:Hashable {
    var city, temp:String
}
