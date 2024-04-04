//
//  ContentView.swift
//  Llamadas y sms
//
//  Created by KevinLA on 04/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact{
            compactDesign()
        }else{
            regularDesign()
        }
    }
}

struct compactDesign: View {
    
    let numero = "3333333333"
    let mensaje = "Hola Como estas"
    
    func sendMessage(){
        let sms = "sms:\(numero)&body=\(mensaje)"
        guard let StringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)else { return }
        UIApplication.shared.open(URL.init(string: StringSMS)!, options: [:], completionHandler: nil)
    }
    
    func sendCall(){
        guard let number = URL(string: "tel//\(numero)") else { return }
        UIApplication.shared.open(number)
    }
    
    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            VStack(){
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 100, weight: .bold))
                Text("Maria Jimenez")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text("Hidalgo #123")
                    .foregroundColor(.white)
                    .font(.title).italic()
                HStack{
                    Button(action:{
                        sendCall()
                    }){
                        Image(systemName: "phone.fill")
                            .modifier(boton(color: .blue))
                    }
                    Button(action:{
                        
                    }){
                        Image(systemName: "message.fill")
                            .modifier(boton(color: .red))
                    }
                }
            }
        }
    }
}


struct boton:  ViewModifier{
    var color : Color
    func body(content: Content) -> some View {
        content
        .padding()
        .background(color)
        .clipShape(Circle())
        .foregroundColor(.white)
        .font(.title)
    }
}

struct regularDesign: View {
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            HStack{
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 100, weight: .bold))
                    .clipShape(Circle())
            }
            VStack{
                Text("Maria Jimenez")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text("Hidalgo #123")
                    .foregroundColor(.white)
                    .font(.title).italic()
            }
        }
    }
}

#Preview {
    ContentView()
}
