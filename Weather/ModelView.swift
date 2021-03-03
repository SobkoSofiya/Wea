//
//  ModelView.swift
//  Weather
//
//  Created by Sofi on 17.02.2021.
//

import Foundation
import SwiftUI
import  SwiftyJSON
import Alamofire


class ModelView: ObservableObject {
    @Published var pin:[Model] = []
    @Published var perehod = 1
    @Published var firstDayArray:[ModelFirstDay] = []
    @Published var firstDayDetail:[ModelFirstDayDetail] = []
    @Published var secondDay:[ModelSecondDayDetail] = []
    @Published var thirdDay:[ModelThirdDayDetail] = []
    @Published var firs:[ModelFirstDay1] = []
    func weather(nameCity: [Any]) {
        pin.removeAll()
        for city in  nameCity{
            let url = "http://api.weatherapi.com/v1/forecast.json?key=34de8e48d0944de6a83131619202610&q=\(city)&days=3"
            AF.request(url, method: .get).validate().responseJSON {[self] response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let timeArray = json["forecast"]["forecastday"][0]["hour"].arrayValue
                    let timeArray2 = json["forecast"]["forecastday"][1]["hour"].arrayValue

                    let timeArray3 = json["forecast"]["forecastday"][2]["hour"].arrayValue

                    print(timeArray)
                    for i in 0..<timeArray.count{
                        self.pin.append(Model(city: json["location"]["name"].stringValue, tempNow: json["current"]["temp_c"].stringValue, date: json[""][""].stringValue, wind: json["current"]["wind_kph"].stringValue, hum: json["current"]["humidity"].stringValue, tempCurr: timeArray[i]["time"].stringValue, time15: timeArray[i]["temp_c"].stringValue, weath: json["current"]["condition"]["text"].stringValue, tempCurr2: timeArray2[i]["time"].stringValue, time152: timeArray2[i]["temp_c"].stringValue, tempCurr3: timeArray3[i]["temp_c"].stringValue, time153: timeArray3[i]["temp_c"].stringValue))
                        if json["error"]["message"].stringValue == "No matching location found."{
                            perehod = 2
                        } else{
                            perehod = 1
                        }
                    }
                    print("JSON: \(json)")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func firstDay() {
        firstDayArray.removeAll()
        if  let cities = UserDefaults.standard.stringArray(forKey: "Cit") {
            for nameCity in cities {
                let url = "http://api.weatherapi.com/v1/forecast.json?key=34de8e48d0944de6a83131619202610&q=\(nameCity)&days=1"
                AF.request(url, method: .get).validate().responseJSON { [self] response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let timeArray = json["forecast"]["forecastday"][0]["hour"].arrayValue
                        for i in 0..<timeArray.count{
                            firstDayArray.append(ModelFirstDay(city: json["location"]["name"].stringValue, temp:  json["current"]["temp_c"].stringValue, tempcur: timeArray[i]["temp_c"].stringValue))
//                        print("JSON: \(json)")
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    func firstDay1(nameCity:String) {
       
                let url = "http://api.weatherapi.com/v1/current.json?key=34de8e48d0944de6a83131619202610&q=\(nameCity)"
                AF.request(url, method: .get).validate().responseJSON { [self] response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        firs.append(ModelFirstDay1(city: json["location"]["name"].stringValue, temp:  json["current"]["temp_c"].stringValue, wind:  json["current"]["wind_kph"].stringValue, hum:  json["current"]["humidity"].stringValue, text: json["current"]["condition"]["text"].stringValue))
//                        print("JSON: \(json)")
                    case .failure(let error):
                        print(error)
                    }
                }
                
    }
    func firstDayDetail(nameCity:String) {
        let url = "http://api.weatherapi.com/v1/forecast.json?key=34de8e48d0944de6a83131619202610&q=\(nameCity)&days=1"
        AF.request(url, method: .get).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let timeArray = json["forecast"]["forecastday"][0]["hour"].arrayValue
                for i in 0..<timeArray.count{
                    firstDayDetail.append(ModelFirstDayDetail(city: json["location"]["name"].stringValue, temp: timeArray[i]["temp_c"].stringValue))
                }
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func secondDayDetail(nameCity:String) {
        let url = "http://api.weatherapi.com/v1/forecast.json?key=34de8e48d0944de6a83131619202610&q=\(nameCity)&days=3"
        AF.request(url, method: .get).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let timeArray = json["forecast"]["forecastday"][1]["hour"].arrayValue
                for i in 0..<timeArray.count{
                    secondDay.append(ModelSecondDayDetail(city: json["location"]["name"].stringValue, temp: timeArray[i]["temp_c"].stringValue))
                }
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func thirdDayDetail(nameCity:String) {
        let url = "http://api.weatherapi.com/v1/forecast.json?key=34de8e48d0944de6a83131619202610&q=\(nameCity)&days=3"
        AF.request(url, method: .get).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let timeArray = json["forecast"]["forecastday"][2]["hour"].arrayValue
                for i in 0..<timeArray.count{
                    thirdDay.append(ModelThirdDayDetail(city: json["location"]["name"].stringValue, temp: timeArray[i]["temp_c"].stringValue))
                }
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
}



struct Mo:Hashable {
    let imag, title:String
}


class Make: ObservableObject {
    @Published var pin:[Mo] = []
    func getImages()    {
        let url = "urlПолученияКартинок"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                for i in 0..<json.count{
                    let p = json[i]["images"][0].arrayValue
                    for item in 0..<p.count{
                        self.pin.append(Mo(imag: p[item].stringValue, title: json[i]["title"].stringValue))
                    }
                }
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }

    }
}

struct Mad:View {
    @StateObject var model = Make()
    @State var pin:Mo!
    @State var sh = false
    var body: some View{
        ZStack{
            ForEach(model.pin, id:\.self){ i in
                Button(action: {
                    pin = i
                    sh.toggle()
                }, label: {
                    VStack{
                        Text("\(i.title)")
                        Image("\(i.imag)")
                    }
                })
                
            }
            if sh{
                La(pin: pin)
            }
        }
    }
}

struct La:View {
    @State var pin:Mo
    var body: some View{
        ZStack{
            Image("\(pin.imag)")
        }
    }
}
//JSON =
//[
//    {
//        title:"aaa"
//        images = [
//        "lala.jpb",
//        "koko.jpb",
//        "rere.jpb"
//        ]
//    },
//    {
//        title:"bbb"
//        images = [
//        "vivi.jpb",
//        "nono.jpb",
//        "wewe.jpb"
//        ]
//    }
//
//]

