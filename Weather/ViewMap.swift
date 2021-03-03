//
//  ViewMap.swift
//  Weather
//
//  Created by Sofi on 18.02.2021.
//

import SwiftUI
import MapKit
struct ViewMap: View {
    @Binding var Swift22:Int
    @State var manager = CLLocationManager()
    @ObservedObject var locDeleg = localDel()
    @ObservedObject var modelVoew = ModelView()
    @State var local = ""
    @State var error = false
    @State var show = true
    @State var stringArray =  UserDefaults.standard.stringArray(forKey: "Cit")
    @State var tempArray =  UserDefaults.standard.stringArray(forKey: "Temp")
    @State var strings: [String] = UserDefaults.standard.object(forKey: "Cit") as? [String] ?? []
    @State var stringsTemp: [String] = UserDefaults.standard.object(forKey: "Temp") as? [String] ?? []
    var body: some View{
        ZStack{
        MapView(region: $locDeleg.region)
            if show{
            RoundedRectangle(cornerRadius: 25.0).frame( height: 430, alignment: .center)
                .foregroundColor(Color("be")).offset( y: -280)
            }
            VStack{
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: UIScreen.main.bounds.width-50, height: 70, alignment: .center)
                        .foregroundColor(.white).shadow(radius: 3 )
                    HStack{
                        Button(action: {
                            Swift22 = 1
                        }, label: {
                            Image("rr").resizable().frame(width: 30, height: 30, alignment: .center).padding()
                        })
                        
                        TextField("Search here", text: $local).frame(width: 200, height: 70, alignment: .center)
                        Spacer()
                        Button(action: {
                            if local == "" {
                                
                            } else{
                                //                            stringArray!.append(contentsOf: [local])
                                
                                //                            UserDefaults.standard.set([stringArray, local], forKey: "City")
                                //                            UserDefaults.standard.set([stringArray!.append(String[local])], forKey: "Cit")
                                
                                strings.append("\(local)")
                                UserDefaults.standard.set(strings, forKey: "Cit")
                                Swift22 = 1
                                show = false
                            }
                        }, label: {
                            Image(local == "" ? "mic" : "a").resizable().frame(width: 25, height: 25, alignment: .center).padding()
                        }).alert(isPresented: $error, content: {
                            Alert(title: Text("Error"), message: Text("Такого города не существует"), dismissButton: .default(Text("OK")))
                        })
                        
                        
                    }.frame(width: UIScreen.main.bounds.width-50, height: 70, alignment: .center)
                }
                if show{
                    Text("Recent search").foregroundColor(Color("bty")).font(.custom("", size: 12)).offset(x: -140, y: 10.0).padding(.vertical)
                    
                    ScrollView{
                        
                        VStack(spacing:20){
                            
                            ForEach(modelVoew.firstDayArray, id:\.self){ i in
                                Button(action: {
                                    local = i.city
                                    strings.append("\(local)")
                                    UserDefaults.standard.set(strings, forKey: "Cit")
                                    Swift22 = 1
                                    show = false
                                }, label: {
                                    HStack{
                                        
                                        Image("cl").resizable().frame(width: 27, height: 27, alignment: .center).padding()
                                        Text("\(i.city)") .foregroundColor(Color("bty"))
                                        Spacer()
                                        Text("\(i.temp)º / \(i.tempcur)º").font(.custom("", size: 14)) .foregroundColor(Color("bty"))
                                        
                                    }.frame( height: 40, alignment: .center).padding(.horizontal,30)
                                })
                                
                                
                                
                                
                            }
                            
                            
                            
                        }
                        
                    }.onAppear(perform: {
                        DispatchQueue.main.async {
                            modelVoew.firstDay()
                        }
                        
                        //                        print(i)
                        
                    }).frame( height: 180, alignment: .center).offset(x:-10)
                }
                Spacer()
            }.offset( y: 70)
            
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            manager.delegate = locDeleg
            manager.startUpdatingLocation()
            manager.requestWhenInUseAuthorization()
        }).onChange(of: local, perform: { value in
            if local == "" {
                show = false
            } else{
                show = true
            }
        })
    }
}

struct ViewMap_Previews: PreviewProvider {
    static var previews: some View {
        ViewMap(Swift22: .constant(3))
    }
}
