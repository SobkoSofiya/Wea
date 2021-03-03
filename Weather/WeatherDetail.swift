//
//  WeatherDetail.swift
//  Weather
//
//  Created by Sofi on 18.02.2021.
//

import SwiftUI

struct WeatherDetail: View {
    @Binding var Swift22:Int
    @State var show = true
    @ObservedObject var viewModel = ModelView()
    @State var stringArray =  UserDefaults.standard.stringArray(forKey: "Cit")
    @State var rec = 1
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("t"), Color("b")]), startPoint: .top, endPoint: .bottom))
            VStack{
                Image("for").resizable().frame(width: UIScreen.main.bounds.width, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            VStack{
                HStack{
                    Button(action: {
                        Swift22 = 1
                    }, label: {
                        Group{
                        Image("arr").resizable().frame(width: 30    , height: 30, alignment: .center).padding(.leading)
                        Text("Back").foregroundColor(.white).font(.custom("", size: 20))
                        }
                    })
                    
                    Spacer()
                    Image("set").resizable().frame(width: 30, height: 30, alignment: .center).padding()
                }
                HStack(alignment:.bottom){
                    Text("Today").foregroundColor(.white).font(.custom("", size: 20)).padding(30).padding(.vertical)
                    Spacer()
                    Text("Sep, 12").foregroundColor(.white).font(.custom("", size: 17)).padding(.vertical, 30).padding(.trailing).padding(.vertical)
                }
                HStack(spacing:10){
                    Button(action: {
                        rec = 2
                    }, label: {
                        ZStack{
                            if rec == 2{
                            RoundedRectangle(cornerRadius: 25.0).strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom), lineWidth: 1).frame(width: 70, height: 150, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white).opacity(0.2))
                            }
                        VStack{
                            Text("\(viewModel.firstDayDetail.count == 0 ? "" : viewModel.firstDayDetail[15].temp)℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                            Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                            Text("15:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                        }.frame(width: 70, height: 150, alignment: .center)
                        }
                    })
                   
                    Button(action: {
                        rec = 3
                    }, label: {
                        ZStack{
                            if rec == 3{
                            RoundedRectangle(cornerRadius: 25.0).strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom), lineWidth: 1).frame(width: 70, height: 150, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white).opacity(0.2))
                            }
                        
                         VStack{
                            Text("\(viewModel.firstDayDetail.count == 0 ? "" : viewModel.firstDayDetail[16].temp )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                        Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                        Text("16:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                    }.frame(width: 70, height: 150, alignment: .center)
                    }
                    })
                  
                    Button(action: {
                        rec = 4
                    }, label: {
                        ZStack{
                            if rec == 4{
                            RoundedRectangle(cornerRadius: 25.0).strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom), lineWidth: 1).frame(width: 70, height: 150, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white).opacity(0.2))
                            }
                    
                    
                             VStack{
                                Text("\(viewModel.firstDayDetail.count == 0 ? "" : viewModel.firstDayDetail[17].temp )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                        Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                        Text("17:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                    }.frame(width: 70, height: 150, alignment: .center)
                        }
                    })
                  
                    Button(action: {
                        rec = 5
                    }, label: {
                        ZStack{
                            if rec == 5{
                            RoundedRectangle(cornerRadius: 25.0).strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom), lineWidth: 1).frame(width: 70, height: 150, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white).opacity(0.2))
                            }
                    VStack{
                        Text("\(viewModel.firstDayDetail.count == 0 ? "" : viewModel.firstDayDetail[18].temp )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                        Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                        Text("18:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                    }.frame(width: 70, height: 150, alignment: .center)
                        }
                    })
                  
                    Button(action: {
                        rec = 6
                    }, label: {
                        ZStack{
                            if rec == 6{
                            RoundedRectangle(cornerRadius: 25.0).strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom), lineWidth: 1).frame(width: 70, height: 150, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white).opacity(0.2))
                            }
                             VStack{
                    Text("\(viewModel.firstDayDetail.count == 0 ? "" : viewModel.firstDayDetail[19].temp )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                    Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                    Text("19:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                }.frame(width: 70, height: 150, alignment: .center)
                        }
                    })
                 
                }
                HStack{
                    Text("Next Forecast").foregroundColor(.white).font(.custom("", size: 20)).padding().padding(.leading)
                    Spacer()
                    Image("ca").resizable().frame(width: 25, height: 25, alignment: .center).padding().padding(.trailing,10)
                    
                }
                ScrollView{
                    HStack{
                        Text("Sep, 13").foregroundColor(.white).font(.custom("", size: 20)).padding(30)
                        Spacer()
                       
                        Image("t").resizable().frame(width: 130, height: 130, alignment: .center).offset(x: -15)
                        Spacer()
                        Text("\(viewModel.secondDay.count == 0 ? "" : viewModel.secondDay[10].temp )º").foregroundColor(.white).font(.custom("", size: 18)).padding(.trailing,80)
                        
                    }.frame( height: 60, alignment: .center)
                    HStack{
                        Text("Sep, 13").foregroundColor(.white).font(.custom("", size: 20)).padding(30)
                        Spacer()
                       
                        Image("t").resizable().frame(width: 130, height: 130, alignment: .center).offset(x: -15)
                        Spacer()
                        Text("\(viewModel.thirdDay.count == 0 ? "" : viewModel.thirdDay[10].temp )º").foregroundColor(.white).font(.custom("", size: 18)).padding(.trailing,80)
                        
                    }.frame( height: 50, alignment: .center)
              
                }.frame(width: UIScreen.main.bounds.width, height: 350, alignment: .center)
                HStack{
                    Image("sun").resizable().frame(width: 30, height: 30, alignment: .center).padding(.trailing,10)
                  
                    Text("AccuWeather").foregroundColor(.white).font(.custom("", size: 18))
                 
                    
                   
                }
                Spacer()
            }.offset( y: 50)
           
          
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            viewModel.secondDayDetail(nameCity: stringArray!.last!)
            viewModel.firstDayDetail(nameCity: stringArray!.last!)
            viewModel.thirdDayDetail(nameCity: stringArray!.last!)
          
        })
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetail(Swift22: .constant(1))
    }
}
