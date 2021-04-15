//
//  Currency.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 14/04/2021.
//

import UIKit

class Currency {
   
    var currencyCode: String
    var currencyDescription: String
        
    var all: [Currency] = [
        Currency(currencyCode: "USD", currencyDescription: "United States Dollar"),
        Currency(currencyCode: "EUR", currencyDescription: "Euros"),
        Currency(currencyCode: "GBP", currencyDescription: "British Pound"),
        Currency(currencyCode: "AUD", currencyDescription: "Australian Dollar"),
        Currency(currencyCode: "CAD", currencyDescription: "Canadian Dollar"),
        Currency(currencyCode: "SGD", currencyDescription: "Singapore Dollar"),
        Currency(currencyCode: "AED", currencyDescription: "Emirati Dirham"),
        Currency(currencyCode: "ARS", currencyDescription: "Argentine Peso"),
        Currency(currencyCode: "BGN", currencyDescription: "Burlgarian Lev"),
        Currency(currencyCode: "BHD", currencyDescription: "Bahrain Dinar"),
        Currency(currencyCode: "BND", currencyDescription: "Bruneuan Dollar"),
        Currency(currencyCode: "BRL", currencyDescription: "Brazilian Real"),
        Currency(currencyCode: "BWP", currencyDescription: "Botswana Pula"),
        Currency(currencyCode: "CHF", currencyDescription: "Swiss Franc"),
        Currency(currencyCode: "CLP", currencyDescription: "Chilean Peso"),
        Currency(currencyCode: "CNY", currencyDescription: "Chinese Yuan Renminbi"),
        Currency(currencyCode: "COP", currencyDescription: "Colombian Peso"),
        Currency(currencyCode: "CZK", currencyDescription: "Czech Koruna"),
        Currency(currencyCode: "DKK", currencyDescription: "Danish Krone"),
        Currency(currencyCode: "HKD", currencyDescription: "Hong Kong Dollar"),
        Currency(currencyCode: "HRK", currencyDescription: "Croatian Kuna"),
        Currency(currencyCode: "HUF", currencyDescription: "Hungarian Forint"),
        Currency(currencyCode: "IDR", currencyDescription: "Indonesian Rupiah"),
        Currency(currencyCode: "ILS", currencyDescription: "Israeli Shekel"),
        Currency(currencyCode: "INR", currencyDescription: "Indian Rupee"),
        Currency(currencyCode: "IRR", currencyDescription: "Iranian Rial"),
        Currency(currencyCode: "ISK", currencyDescription: "Icelandic Krona"),
        Currency(currencyCode: "JPY", currencyDescription: "Japanese Yen"),
        Currency(currencyCode: "KRW", currencyDescription: "South Korean Won"),
        Currency(currencyCode: "KWD", currencyDescription: "Kuwaiti Dinar"),
        Currency(currencyCode: "KZT", currencyDescription: "Kazakhstani Tenge"),
        Currency(currencyCode: "LKR", currencyDescription: "Sri Lankan Rupee"),
        Currency(currencyCode: "LYD", currencyDescription: "Libyan Dinar"),
        Currency(currencyCode: "MUR", currencyDescription: "Mauritian Rupee"),
        Currency(currencyCode: "MXN", currencyDescription: "Mexican Peso"),
        Currency(currencyCode: "MYR", currencyDescription: "Malaysian Ringgit"),
        Currency(currencyCode: "NOK", currencyDescription: "Norwegian Krone"),
        Currency(currencyCode: "NPR", currencyDescription: "Nepalase Rupee"),
        Currency(currencyCode: "NZD", currencyDescription: "New Zealand Dollar"),
        Currency(currencyCode: "OMR", currencyDescription: "Omani Rial"),
        Currency(currencyCode: "PHP", currencyDescription: "Philippine Peso"),
        Currency(currencyCode: "PKR", currencyDescription: "Pakistani Rupee"),
        Currency(currencyCode: "PLN", currencyDescription: "Polish Zloty"),
        Currency(currencyCode: "QAR", currencyDescription: "Qatari Riyal"),
        Currency(currencyCode: "RON", currencyDescription: "Romanian New Leu"),
        Currency(currencyCode: "RUB", currencyDescription: "Russian Ruble"),
        Currency(currencyCode: "SAR", currencyDescription: "Saudi Arabian Riyal"),
        Currency(currencyCode: "SEK", currencyDescription: "Swedish Krona"),
        Currency(currencyCode: "THB", currencyDescription: "Thai Baht"),
        Currency(currencyCode: "TRY", currencyDescription: "Turkish Lira"),
        Currency(currencyCode: "TTD", currencyDescription: "Trinidadian Dollar"),
        Currency(currencyCode: "TWD", currencyDescription: "Taiwan New Dollar"),
        Currency(currencyCode: "VEF", currencyDescription: "Venezuelan Bolivar"),
        Currency(currencyCode: "ZAR", currencyDescription: "South African Rand")
    ]
     
   
    
    
    init(currencyCode: String, currencyDescription: String) {
        self.currencyCode = currencyCode
        self.currencyDescription = currencyDescription
    }
        
}

