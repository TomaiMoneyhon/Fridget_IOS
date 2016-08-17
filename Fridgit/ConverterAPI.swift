//
//  ConverterAPI.swift
//  Fridgit
//
//  Created by Admin on 19/06/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

enum Converters {
    case CookingUnits, WeightUnits
}

class ConverterAPI: NSObject, NSXMLParserDelegate {

    var convertURL: String!
    var result : Double!
    var parser = NSXMLParser()
    var passData : Bool!
    
    func convert(amount: Double, fromUnit: String, toUnit: String, converter: Converters) -> Double {
        
        switch converter {
            
        case Converters.CookingUnits:
            convertURL = "http://www.webservicex.net/ConvertCooking.asmx/ChangeCookingUnit?CookingValue=" + String(amount) + "&fromCookingUnit=" + fromUnit + "&toCookingUnit=" + toUnit
            
        case Converters.WeightUnits:
            convertURL = "http://www.webservicex.net/ConvertWeight.asmx/ConvertWeight?Weight=" + String(amount) + "&FromUnit=" + fromUnit + "&ToUnit=" + toUnit
        }
        
        let url = NSURL(string: convertURL)
        parser = NSXMLParser(contentsOfURL: url!)!
        parser.delegate = self
        
        parser.parse()
        
       return result
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if (Double(string) != nil){
        result = Double(string)
        }
        else {
            print("something went wrong in the converter")
        }
    }
///IF OTHER OPTION IN XML FILE ARE AVAILABLE
//    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
//        if elementName == "double" {
//            passData = true
//        }
//        else {
//            passData = false
//        }
//    }
    

}
