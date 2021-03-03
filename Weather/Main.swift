//
//  Main.swift
//  Weather
//
//  Created by Sofi on 18.02.2021.
//

import SwiftUI

struct Main: View {
    @State var show =  false
    @Binding var Swift22:Int
//    @State var model:Model
    @ObservedObject var viewModel = ModelView()
    @State var stringsTemp: [String] = UserDefaults.standard.object(forKey: "Temp") as? [String] ?? []
    @State var tempArray =  UserDefaults.standard.stringArray(forKey: "Temp")
//   @ObservedObject var firstDay = ModelFirstDay()
    @State var stringArray =  UserDefaults.standard.stringArray(forKey: "Cit")
    let i = UserDefaults.standard.object(forKey: "Cit")
    var body: some View {
        ZStack{
            ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("t"), Color("b")]), startPoint: .top, endPoint: .bottom))
            VStack{
                Image("for").resizable().frame(width: UIScreen.main.bounds.width, height: 350, alignment: .center)
                Spacer()
            }
            VStack{
                HStack{
                    Image("pin").padding(.leading)
                    Button(action: {
                        Swift22 = 3
                    }, label: {
                        Text("\(viewModel.firs.first?.city ?? "")").foregroundColor(.white).font(.custom("", size: 20)).padding()
                       
                    })
                   
                    Spacer()
                    Button(action: {
                        show.toggle()
                    }, label: {
                        Image("no").resizable().frame(width: 20, height: 20, alignment: .center).padding()
                    })
                    
                }
                Image("tu").resizable().frame(width: 300, height: 304, alignment: .center)
                ZStack{
                    RoundedRectangle(cornerRadius: 14).strokeBorder(Color("for")).frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.width-100, alignment: .center).background(RoundedRectangle(cornerRadius: 14).foregroundColor(Color.white).opacity(0.3))
                    VStack{
                    Text("Today, 12 September").foregroundColor(.white).font(.custom("", size: 18)).padding(.top).offset( y: -20)
                        Text("\(viewModel.firs.first?.temp ?? "")º").foregroundColor(.white).font(.custom("", size: 100)).padding().offset( y: -20)
                        Text("\(viewModel.firs.first?.text ?? "")").foregroundColor(.white).font(.custom("", size: 20)).offset( y: -30)
                        VStack(alignment:.leading){
                        HStack(spacing:20){
                            Image("w")
                            Text("Whind").foregroundColor(.white).font(.custom("", size: 15))
                            Rectangle()
                                .frame(width: 1, height: 15, alignment: .center).foregroundColor(.white)
                            Text("\(viewModel.firs.first?.wind ?? "")km/h").foregroundColor(.white).font(.custom("", size: 15))
                        }
                        HStack(spacing:20){
                            Image("ka")
                            Text("Hum").foregroundColor(.white).font(.custom("", size: 15)).padding(.leading,2)
                            Rectangle()
                                .frame(width: 1, height: 15, alignment: .center).foregroundColor(.white).padding(.leading,10)
                            Text("\(viewModel.firs.count == 0 ? "" : viewModel.firs[0].hum)%").foregroundColor(.white).font(.custom("", size: 15))
                        }
                        }
                    }
                }.offset( y: -50)
                Button(action: {
                    Swift22 = 2
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25).foregroundColor(.white).frame(width: 200, height: 60, alignment: .center)
                        HStack{
                        Text("Forecast report").foregroundColor(Color("te")).font(.custom("", size: 15))
                            Image("a")
                        }
                    }.offset( y: 20)
                })
              
                Spacer()
            }.offset( y: 50)
            }.blur(radius: show ? 5 : 0)
            if show{
            GeometryReader{ i in
                
                Custom(show: $show)
            }.background(Color.clear).edgesIgnoringSafeArea(.all)
            }
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            
//            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//                UserDefaults.standard.set(["\(viewModel.firstDay.first?.temp ?? "")º"], forKey: "Temp")
//            }
           
//            UserDefaults.standard.set(["London"], forKey: "Cit")
            
//            print(stringArray!.first!)
//            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//                stringsTemp.append(viewModel.firstDay.first?.temp ?? "")
//                UserDefaults.standard.set(stringsTemp, forKey: "Temp")
//            }
           
           
            viewModel.firstDay1(nameCity: stringArray!.last!  )

            
            
          
        })
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main( Swift22: .constant(1))
    }
}
