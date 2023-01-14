//
//  arabic.swift
//  SparkyProject
//
//  Created by raghad khalid alsaif on 22/06/1444 AH.
//


import SwiftUI

struct arabic: View {
    var qoutesE = ["I’m \nworking on \na new me." ,"My \nlife is my\nmessage ...","Tell someone\n how much\n you love him","Die with\nmemories, \nnot dreams.","Everything\nhappens\nfor a reason.","Feed \nthree street \nanimals ..","Truth\nhurt , but \nlies can kill !.","What \nwe think \nwe become.","Buy \na meal for\na dustman ."]
    
    var authorE = ["unknown" ,"GHANDI","Task of the day","unknown","Marliyn Monroe","Task of the day","Karen Marie","Buddha","Task of the day"]
    let timeer = Timer.publish(every: 3600.0, on: .main, in: .common).autoconnect()
    @State private var i = 0
    @State var counttr = 24

    var body: some View {  NavigationView{
        
        
        ZStack {
            Image("Image").resizable().frame(width: 500,height: 1000)
                .padding(.top,80)
                .imageScale(.large)
            Text("") .frame(width: 500,height: 1000).background(.black).opacity(0.28)
            
            ZStack{
                Image(systemName:"quote.opening").resizable().frame(width:63 ,height: 38)
                    .padding(.top,-248)
                    .padding(.leading,-165)
                    .foregroundColor(Color(red: 0.06,
                            green: 0.744,
                            blue:0.565)).flipsForRightToLeftLayoutDirection(true).environment(\.layoutDirection,.leftToRight)
               
                //Start here
              //  ForEach() { qoute in
               //     Text(qoutes[])
              //  }
                if counttr < 1 {
                    
                    Text(authorE[i]).foregroundColor(Color(red: 0.06, green: 0.744, blue: 0.565)).font(.system(size: 20)).padding(.top,60)
                        .padding(.leading,-170)
                        .flipsForRightToLeftLayoutDirection(true).environment(\.layoutDirection,.leftToRight)
                Text(qoutesE[i])
                    .accessibilityLabel(Text(qoutesE[i]))
                    .foregroundColor(.white).font(.system(size: 60))
                    .padding(.top,-180)
                    .padding(.leading,-35)
                    .flipsForRightToLeftLayoutDirection(true).environment(\.layoutDirection,.leftToRight)
                    .onReceive(timeer, perform: { _ in
                       counttr = 24
                       i += 1
                      if i >= qoutesE.count{
                          i = 0
                           
                       }
                   })
                
            } else{
                Text(authorE[i]).foregroundColor(Color(red: 0.06, green: 0.744, blue: 0.565)).font(.system(size: 20)).padding(.top,60)
                    .padding(.leading,-170)
                    .flipsForRightToLeftLayoutDirection(true).environment(\.layoutDirection,.leftToRight)
                Text(qoutesE[i]).foregroundColor(.white).font(.system(size: 60))
                    .padding(.top,-180)
                    .padding(.leading,-35)
                    .flipsForRightToLeftLayoutDirection(true).environment(\.layoutDirection,.leftToRight).onReceive(timeer, perform: { _ in
                counttr -= 1})}
       
       
       

         //
                //
                ///
                //////
                ////////
                ////
                ///
                ///////
                
                
                
                
                
                
                
                
                
             
                
                
                
                ZStack{
                    NavigationLink(destination: Home().navigationBarBackButtonHidden(true), label:{ Text("Arabic").foregroundColor(Color(red: 0.06, green: 0.744, blue: 0.565)).font(.body)})}.padding(.top,-360)
                 .padding(.leading,-160).edgesIgnoringSafeArea(.all)
              
           }
      
        
    
            
        }}.edgesIgnoringSafeArea(.all)

    }
}

struct arabic_Previews: PreviewProvider {
    static var previews: some View {
        arabic()
    }
}


