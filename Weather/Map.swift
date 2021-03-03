//
//  Map.swift
//  Weather
//
//  Created by Sofi on 17.02.2021.
//

import SwiftUI
import MapKit

struct Ma:View {
    @Binding var Swift22:Int
    @State var manager = CLLocationManager()
    @ObservedObject var locDeleg = localDel()
    @ObservedObject var modelVoew = ModelView()
    @State var local = ""
    @State var error = false
    @State var show = false
    var body: some View{
        ZStack{
        MapView(region: $locDeleg.region)
            RoundedRectangle(cornerRadius: 25.0).frame( height: 450, alignment: .center)
                .foregroundColor(Color("be")).offset( y: -230).opacity(local == "" ? 0 : 1)
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
                            citis = [local]
                          if  modelVoew.perehod == 1 {
                                Swift22 = 1
                          } else if modelVoew.perehod == 2 {
                            error.toggle()
                          }
                        }
                    }, label: {
                        Image(local == "" ? "mic" : "a").resizable().frame(width: 25, height: 25, alignment: .center).padding()
                    }).alert(isPresented: $error, content: {
                        Alert(title: Text("Error"), message: Text("Такого города не существует"), dismissButton: .default(Text("OK")))
                    })
                   
                   
                }.frame(width: UIScreen.main.bounds.width-50, height: 70, alignment: .center)
            }
                Text("Recent search").foregroundColor(.black).font(.custom("", size: 12)).offset(x: -120, y: 10.0)
                ScrollView{
                    Text("\(modelVoew.pin.count)").foregroundColor(.black)
                ForEach(modelVoew.pin, id:\.self){ i in
                    HStack{
                    
                        Image("cl").padding()
                    }.frame( height: 40, alignment: .center)
                    Text("\(i.city)")
                    Spacer()
                    Text("\(i.tempNow)")
                }.frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                
                }.frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                Spacer()
            }.offset( y: 70)
            
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            manager.delegate = locDeleg
            manager.startUpdatingLocation()
            manager.requestWhenInUseAuthorization()
        })
    }
}



struct MapView: View {
    @Binding var region:MKCoordinateRegion
    var body: some View {
        ZStack{
            Map(coordinateRegion:$region, showsUserLocation:true)
        }
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Ma(Swift22: .constant(3))
    }
}




class localDel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region:MKCoordinateRegion = MKCoordinateRegion()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        region = MKCoordinateRegion(center: locations.last!.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
    }
    
}



