//
//  Detail.swift
//  Weather
//
//  Created by Sofi on 17.02.2021.
//

import SwiftUI

struct Detail: View {
    @Binding var Swift22:Int
    @State var show = true
    @ObservedObject var viewModel = ModelView()
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
                HStack(spacing:20){
                    
                    VStack{
                        Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[15].time15)℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                        Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                        Text("15:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                    }.frame(width: 60, height: 150, alignment: .center)

                     VStack{
                    Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[16].time15 )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                    Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                    Text("16:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                }.frame(width: 60, height: 150, alignment: .center)
                         VStack{
                    Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[17].time15 )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                    Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                    Text("17:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                }.frame(width: 60, height: 150, alignment: .center)
                VStack{
                    Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[18].time15 )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                    Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                    Text("18:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
                }.frame(width: 60, height: 150, alignment: .center)
                         VStack{
                Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[19].time15 )℃").foregroundColor(.white).font(.custom("", size: 18)).offset( y: 30)
                Image("t").resizable().frame(width: 130, height: 130, alignment: .center)
                Text("19:00").foregroundColor(.white).font(.custom("", size: 18)).offset( y: -40)
            }.frame(width: 60, height: 150, alignment: .center)
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
                        Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[10].time152 )º").foregroundColor(.white).font(.custom("", size: 18)).padding(.trailing,100)
                        
                    }.frame( height: 60, alignment: .center)
                    HStack{
                        Text("Sep, 13").foregroundColor(.white).font(.custom("", size: 20)).padding(30)
                        Spacer()
                       
                        Image("t").resizable().frame(width: 130, height: 130, alignment: .center).offset(x: -15)
                        Spacer()
                        Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[10].time153 )º").foregroundColor(.white).font(.custom("", size: 18)).padding(.trailing,100)
                        
                    }.frame( height: 50, alignment: .center)
              
                }.frame(width: UIScreen.main.bounds.width, height: 350, alignment: .center)
                HStack{
                    Image("sun").resizable().frame(width: 30, height: 30, alignment: .center).padding(.trailing,10)
                  
                    Text("AccuWeather").foregroundColor(.white).font(.custom("", size: 18))
                 
                    
                   
                }
                Spacer()
            }.offset( y: 50)
           
          
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            
            viewModel.weather(nameCity: citis)
          
        })
    }
}
//.blur(radius: show ? 6 :0)
struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(Swift22: .constant(2))
    }
}



