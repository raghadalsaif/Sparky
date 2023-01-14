//
//  ContentView.swift
//  SparkyProject
//
//  Created by raghad khalid alsaif on 22/06/1444 AH.
//



import SwiftUI

struct Home: View {
    var qoutesA = ["لا تندم\nأبدًا ، على\nحربٍ أنضجتك  !.","لاتحاول إسقاطي\nشهب السماء\nسقوطها قد يقتلك!" ,"مايتوجب عليك\nفعله إفعله الآن    \nالظروف ستبقى\nصعبة دائما .","اشتر وجبة\nطعام متكاملة\nلمحتاجين أو أكثر.","ومن لايحب صعود\nالجبال ، يعش أبد\nالدهر بين الحفر","لاتدع جهل الناس\nبك، يغلب علمك\nبنفسك ..","سبحان الله وبحمده\nسبحان الله العظيم\n(ألف مرة)","لاتفصح\nعن خريفك إلا لمن\nينهمر عليك بمطره.","أخبر ٣ أشخاص\nبمشاعرك اتجاههم\nبأي طريقة تختارها.","لن\nيشفيك الهرب، كل \nالشفاء بالمواجهة"]
    
    var authorA = ["محمود درويش" ,"غير معروف","غير معروف","مهمة اليوم","أبو القاسم الشابي","علي بن أبي طالب \nرضي الله عنه","مهمة اليوم","غير معروف","مهمة اليوم","غير معروف"]
    let timer = Timer.publish(every: 3600.0, on: .main, in: .common).autoconnect()
    @State private var i = 0
    @State var countt = 24


    var body: some View {
        
        
        NavigationView{
        
        
        ZStack {
            Image("Image").resizable().frame(width: 500,height: 1000)
                .padding(.top,80)
                .imageScale(.large)
            Text("") .frame(width: 500,height: 1000).background(.black).opacity(0.28)
            
            ZStack{
                Image(systemName:"quote.opening").resizable().frame(width:63 ,height: 38)
                    .padding(.top,-248) .padding(.leading,-160).foregroundColor(Color(red: 0.06, green: 0.744, blue: 0.565))
               
                
                
               if countt < 1 {
                   
                   Text(authorA[i])
                       .foregroundColor(Color(red: 0.06, green: 0.744, blue: 0.565)).font(.system(size: 20)).flipsForRightToLeftLayoutDirection(false).environment(\.layoutDirection, .rightToLeft).padding(.top,70)
                       .padding(.leading,-150)
                Text(qoutesA[i]).foregroundColor(.white).font(.system(size: 50))
                    .padding(.top,-190)
                    .padding(.leading,17)
                    .onReceive(timer, perform: { _ in
                        countt = 24
                        i += 1
                        if i >= qoutesA.count{
                            i = 0
                           
                        }
                    })
            } else{
                Text(authorA[i])
                    .foregroundColor(Color(red: 0.06, green: 0.744, blue: 0.565)).font(.system(size: 20)).flipsForRightToLeftLayoutDirection(false).environment(\.layoutDirection, .rightToLeft).padding(.top,70)
                    .padding(.leading,-150)
                Text(qoutesA[i]).foregroundColor(.white).font(.system(size: 50))
                    .padding(.top,-190)
                    .padding(.leading,17)
                    .onReceive(timer, perform: { _ in
                countt -= 1})}
                
                
               
                
                ZStack{
                    NavigationLink(destination: arabic().navigationBarBackButtonHidden(true), label:{ Text("English").foregroundColor(Color(red: 0.06, green: 0.744, blue: 0.565)).font(.body)})}.padding(.top,-360)
                 .padding(.leading,250).edgesIgnoringSafeArea(.all)
            
           }
      
        }}.edgesIgnoringSafeArea(.all)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
