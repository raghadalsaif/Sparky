//
//  SparkyConfig.swift
//  SparkyProject
//
//  Created by raghad khalid alsaif on 22/06/1444 AH.
//


import SwiftUI


var qoutesE = ["I’m \nworking on \na new me." ,"My \nlife is my\nmessage ...","Tell someone\n how much\n you love him","Die with\nmemories, \nnot dreams.","Everything\nhappens\nfor a reason.","Feed \nthree street \nanimals ..","Truth\nhurt , but \nlies can kill !.","What \nwe think \nwe become.","Buy \na meal for\na dustman ."]

struct  SparkyConfig {
   
    let qoutesE: String
    
    
    static func determineConfig(from date: Date) -> SparkyConfig {
        let montheint = Calendar.current.component(.day, from: date)
        
        switch montheint{
        case 1:
            
            return SparkyConfig(qoutesE: "I’m working on \na new me.")
            
        case 2:
            
            return SparkyConfig(qoutesE: "My \nlife is my\nmessage ...")
        case 3:
                 
            return SparkyConfig(qoutesE: "Tell someone\n how much\n you love him")
            
        case 4:
            return SparkyConfig(qoutesE: "Die with\nmemories, \nnot dreams.")
            
        case 5:
            return SparkyConfig(qoutesE: "Everything\nhappens\nfor a reason.")
            
            
        case 6:
            return SparkyConfig(qoutesE: "Feed \nthree street \nanimals ..")
            
        case 7:
            return SparkyConfig(qoutesE: "Truth\nhurt , but \nlies can kill !.")
            
            
        case 8:
            return SparkyConfig(qoutesE: "What \nwe think \nwe become.")
            
        case 9:
            
            return SparkyConfig(qoutesE: "Buy \na meal for\na dustman .")
            
        case 10:
            return SparkyConfig(qoutesE: "I’m \nworking on \na new me.")
            
        case 11:
            return SparkyConfig(qoutesE: "I’m \nworking on \na new me.")
        
        case 12:
            
            return SparkyConfig(qoutesE: "I’m \nworking on \na new me.")
            
            default:
            
            return SparkyConfig(qoutesE: "I’m \nworking on \na new me.")
             
        }
    }
}

