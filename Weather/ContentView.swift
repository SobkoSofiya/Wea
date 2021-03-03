//
//  ContentView.swift
//  Weather
//
//  Created by Sofi on 16.02.2021.
//

import SwiftUI




struct ContentView: View {
    @State var show =  true
    @Binding var Swift22:Int
//    @State var model:Model
    @ObservedObject var viewModel = ModelView()
   
    var body: some View {
        ZStack{
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
                    Image("pin").padding(.leading)
                    Button(action: {
                        Swift22 = 3
                    }, label: {
                        Text("\(viewModel.pin.first?.city ?? "")").foregroundColor(.white).font(.custom("", size: 20)).padding()
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
                        Text("\(viewModel.pin.first?.tempNow ?? "")º").foregroundColor(.white).font(.custom("", size: 100)).padding().offset( y: -20)
                        Text("\(viewModel.pin.first?.weath ?? "")").foregroundColor(.white).font(.custom("", size: 20)).offset( y: -30)
                        VStack(alignment:.leading){
                        HStack(spacing:20){
                            Image("w")
                            Text("Whind").foregroundColor(.white).font(.custom("", size: 15))
                            Rectangle()
                                .frame(width: 1, height: 15, alignment: .center).foregroundColor(.white)
                            Text("\(viewModel.pin.first?.wind ?? "")km/h").foregroundColor(.white).font(.custom("", size: 15))
                        }
                        HStack(spacing:20){
                            Image("ka")
                            Text("Hum").foregroundColor(.white).font(.custom("", size: 15)).padding(.leading,2)
                            Rectangle()
                                .frame(width: 1, height: 15, alignment: .center).foregroundColor(.white).padding(.leading,10)
                            Text("\(viewModel.pin.count == 0 ? "" : viewModel.pin[0].hum)%").foregroundColor(.white).font(.custom("", size: 15))
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
            
            viewModel.weather(nameCity: citis)
            print(viewModel.pin.count)
          
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( Swift22: .constant(1))
    }
}


var citis: [String] = ["London"]




struct Custom:View {
    @Binding var show:Bool
    @State var vi = 1
    @State var off: CGFloat = 0
    var body: some View{
        ZStack{
            ZStack(alignment:.leading){
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.white)
                .frame( height: 450, alignment: .center)
               
                VStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color("ty")).background(Color("ty"))
                        .frame(width: 40, height: 2, alignment: .center).offset(x: 190,y:-13)
                    Group{
                    Text("Your notification").foregroundColor(Color("bty")).font(.custom("", size: 20)).padding(.vertical)
                Text("New").foregroundColor(Color("ty")).font(.custom("", size: 12))
                    }.padding(.leading,28)

                        HStack{
                            Image("su").resizable().frame(width: 25, height: 25, alignment: .center).padding(30)
                            VStack(alignment:.leading){
                                Text("10 minutes ago").foregroundColor(.gray).opacity(0.4).font(.custom("", size: 12)).padding(.vertical)
                                
                                Text("A sunny day in your location, consider \nwearing your UV protection").foregroundColor(Color("ty")).font(.custom("", size: 12)).offset( y: -17)
                                
                            }
                            Image("ar").resizable().frame(width: 20, height: 20, alignment: .center).offset(x: 40)
                            Spacer()
                        }.frame(width: UIScreen.main.bounds.width, alignment: .center).background(vi == 2 ? Color("q28").opacity(0.28) : Color.white).onTapGesture(perform: {
                            vi = 2
                        })
                    Text("Earlier").foregroundColor(Color("ty")).font(.custom("", size: 12)).padding(.leading,28)
                    HStack{
                        Image("wi").resizable().frame(width: 25, height: 25, alignment: .center).padding(30)
                        VStack(alignment:.leading){
                            Text("1 day ago").foregroundColor(.black).opacity(0.4).font(.custom("", size: 12)).padding(.vertical)
                            
                            Text("A cloudy day will occur all day long, \ndon't worry about the heat of the sun").foregroundColor(Color("ty")).font(.custom("", size: 12)).offset( y: -17)
                            
                        }
                        
                        Image("ar").resizable().frame(width: 20, height: 20, alignment: .center).offset(x: 52)
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width, alignment: .center).background(vi == 3 ? Color("q28").opacity(0.28)  : Color.white).onTapGesture(perform: {
                        vi = 3
                    })
                    HStack{
                        Image("ra").resizable().frame(width: 25, height: 25, alignment: .center).padding(30)
                        VStack(alignment:.leading){
                            Text("2 day ago").foregroundColor(.black).opacity(0.4).font(.custom("", size: 12)).padding(.vertical)
                            
                            Text("Potential for rain today is 84%, don't \nforget to bring your umbrella.").foregroundColor(Color("ty")).font(.custom("", size: 12)).offset( y: -17)
                            
                        }
                        Image("ar").resizable().frame(width: 20, height: 20, alignment: .center).offset(x: 52)
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width, alignment: .center).background(vi == 4 ? Color("q28").opacity(0.28) : Color.white).onTapGesture(perform: {
                        vi = 4
                    })
                    
                }
            }.offset( y: 450)
                
            
        }.edgesIgnoringSafeArea(.all).offset( y: off).animation(.linear)
        .gesture(DragGesture()
                                                .onChanged({ (value) in
                                                    if value.translation.height > -50{
                                                        off = value.translation.height
                                                    }
                                                })
                                                .onEnded({ (value) in
                                                    if value.translation.height > 300{
                                                        show.toggle()
                                                    } else{
                                                        off = 0
                                                    }
                                                })
            
        )
    }
}
