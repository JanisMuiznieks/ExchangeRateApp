//
//  Currency.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 14/04/2021.
//

import UIKit
import Foundation

struct CurrencyCodeData {
    let code: String
    var fullName: CurrencyCode?
    var flag: UIImage?
    
    init(code: String) {
        self.code = code
        
        // If `code` value has the same name as country flag images,
        // it's redundant to switch, instead `UIImage(named: code)` would cover every single case.
        switch code {
        case "EUR":
            self.fullName = .eur
            self.flag = UIImage(named: "EUR")
        case "AUD":
            self.fullName = .aud
            self.flag = UIImage(named: "AUD")
        case "BGN":
            self.fullName = .bgn
            self.flag = UIImage(named: "BGN")
        case "BRL":
            self.fullName = .brl
            self.flag = UIImage(named: "BRL")
        case "CAD":
            self.fullName = .cad
            self.flag = UIImage(named: "CAD")
        case "CHF":
            self.fullName = .chf
            self.flag = UIImage(named: "CHF")
        case "CNY":
            self.fullName = .cny
            self.flag = UIImage(named: "CNY")
        case "CZK":
            self.fullName = .czk
            self.flag = UIImage(named: "CZK")
        case "DKK":
            self.fullName = .dkk
            self.flag = UIImage(named: "DKK")
        case "GBP":
            self.fullName = .gbp
            self.flag = UIImage(named: "GBP")
        case "HKD":
            self.fullName = .hkd
            self.flag = UIImage(named: "HKD")
        case "HRK":
            self.fullName = .hrk
            self.flag = UIImage(named: "HRK")
        case "HUF":
            self.fullName = .huf
            self.flag = UIImage(named: "HUF")
        case "IDR":
            self.fullName = .idr
            self.flag = UIImage(named: "IDR")
        case "ILS":
            self.fullName = .ils
            self.flag = UIImage(named: "ILS")
        case "INR":
            self.fullName = .inr
            self.flag = UIImage(named: "INR")
        case "ISK":
            self.fullName = .isk
            self.flag = UIImage(named: "ISK")
        case "JPY":
            self.fullName = .jpy
            self.flag = UIImage(named: "JPY")
        case "KRW":
            self.fullName = .krw
            self.flag = UIImage(named: "KRW")
        case "MXN":
            self.fullName = .mxn
            self.flag = UIImage(named: "MXN")
        case "MYR":
            self.fullName = .mry
            self.flag = UIImage(named: "MYR")
        case "NOK":
            self.fullName = .nok
            self.flag = UIImage(named: "NOK")
        case "NZD":
            self.fullName = .nzd
            self.flag = UIImage(named: "NZD")
        case "PHP":
            self.fullName = .php
            self.flag = UIImage(named: "PHP")
        case "PLN":
            self.fullName = .pln
            self.flag = UIImage(named: "PLN")
        case "RON":
            self.fullName = .ron
            self.flag = UIImage(named: "RON")
        case "RUB":
            self.fullName = .rub
            self.flag = UIImage(named: "RUB")
        case "SEK":
            self.fullName = .sek
            self.flag = UIImage(named: "SEK")
        case "SGD":
            self.fullName = .sgd
            self.flag = UIImage(named: "SGD")
        case "THB":
            self.fullName = .thb
            self.flag = UIImage(named: "THB")
        case "USD":
            self.fullName = .usd
            self.flag = UIImage(named: "USD")
        case "ZAR":
            self.fullName = .zar
            self.flag = UIImage(named: "ZAR")
        default:
            self.fullName = .none
        }
    }
}

// This enum should have been the only data type
// with properties for country flag image and full currency title, therefore,
// `rawValue` should have been country codes.
enum CurrencyCode: String {
    case eur = "Euros",
         aud = "Australian Dollar",
         bgn = "Burlgarian Lev",
         brl = "Brazilian Real",
         cad = "Canadian Dollar",
         chf = "Swiss Franc",
         cny = "Chinese Yuan Renminbi",
         czk = "Czech Koruna",
         dkk = "Danish Krone",
         gbp = "British Pound",
         hkd = "Hong Kong Dollar",
         hrk = "Croatian Kuna",
         huf = "Hungarian Forint",
         idr = "Indonesian Rupiah",
         ils = "Israeli Shekel",
         inr = "Indian Rupee",
         isk = "Icelandic Krona",
         jpy = "Japanese Yen",
         krw = "South Korean Won",
         mxn = "Mexican Peso",
         mry = "Malaysian Ringgit",
         nok = "Norwegian Krone",
         nzd = "New Zealand Dollar",
         php = "Philippine Peso",
         pln = "Polish Zloty",
         ron = "Romanian New Leu",
         rub = "Russian Ruble",
         sek = "Swedish Krona",
         sgd = "Singapore Dollar",
         thb = "Thai Baht",
         usd = "United States Dollar",
         zar = "South African Rand"
}
