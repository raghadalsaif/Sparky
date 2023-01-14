//
//  SparkyWidget.swift
//  SparkyWidget
//
//  Created by raghad khalid alsaif on 22/06/1444 AH.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DayEntry) -> ()) {
        let entry = DayEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DayEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(date: startOfDate, configuration: configuration)
            // add the entry to the entries array at the top
            entries.append(entry)
        }


        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct DayEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct SparkyWidgetEntryView : View {
    
    var entry: DayEntry
    var config : SparkyConfig
    
    init(entry: DayEntry) {
        self.entry = entry
        self.config = SparkyConfig.determineConfig(from: entry.date)
    }
    
    

    var body: some View {
        
        ZStack {
            
            ContainerRelativeShape()
            Image("Image")
                .resizable()
                .frame(width: 400,height: 400)
                .padding(.top,0)
                .imageScale(.large)
            Text("")
                .frame(width: 400,height: 400)
                .background(.black).opacity(0.28)
                    
         ZStack{
            Image(systemName:"quote.opening")
                .resizable()
                .frame(width:18 ,height: 18)
                .padding(.top,-50)
                .padding(.leading,-130)
                .foregroundColor(Color(red: 0.06,
                                        green: 0.744,
                                        blue:0.565))

                     
             Text(config.qoutesE)
                .accessibilityLabel(Text("I’m working on a new me."))
                .minimumScaleFactor(0.6)
                .foregroundColor(.white.opacity(0.9)).font(.system(size: 30))
                .padding(.top,30)
                .padding(.leading,-50)
                           



                  
              
                
            
                    
                }
            
            
        }.edgesIgnoringSafeArea(.all)
        Text(entry.date, style: .time)
    }
}

struct SparkyWidget: Widget {
    let kind: String = "SparkyWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SparkyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge,.systemMedium])
    }
}

struct SparkyWidget_Previews: PreviewProvider {
    static var previews: some View {

        Group{
            
            SparkyWidgetEntryView(entry: DayEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            SparkyWidgetEntryView(entry: DayEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
