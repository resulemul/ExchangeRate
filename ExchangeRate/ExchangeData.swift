//
//  ExchangeData.swift
//  ExchangeRate
//
//  Created by Resul Emül on 10/28/20.
//

import Foundation

struct ExchangeData: Codable {
    let base: String
    let rates: Rate
    let date: String
}

struct Rate: Codable {
    let CAD: Double
    let HKD: Double
    let ISK: Double
    let PHP: Double
    let DKK: Double
    let HUF: Double
    let CZK: Double
    let GBP: Double
    let RON: Double
    let SEK: Double
    let IDR: Double
    let INR: Double
    let BRL: Double
    let RUB: Double
    let HRK: Double
    let JPY: Double
    let THB: Double
    let CHF: Double
    let EUR: Double
    let MYR: Double
    let BGN: Double
    let TRY: Double
    let CNY: Double
    let NOK: Double
    let NZD: Double
    let ZAR: Double
    let USD: Double
    let MXN: Double
    let SGD: Double
    let AUD: Double
    let ILS: Double
    let KRW: Double
    let PLN: Double
}

struct Rates {
    let CAD: Double
    let HKD: Double
    let ISK: Double
    let PHP: Double
    let DKK: Double
    let HUF: Double
    let CZK: Double
    let GBP: Double
    let RON: Double
    let SEK: Double
    let IDR: Double
    let INR: Double
    let BRL: Double
    let RUB: Double
    let HRK: Double
    let JPY: Double
    let THB: Double
    let CHF: Double
    let EUR: Double
    let MYR: Double
    let BGN: Double
    let TRY: Double
    let CNY: Double
    let NOK: Double
    let NZD: Double
    let ZAR: Double
    let USD: Double
    let MXN: Double
    let SGD: Double
    let AUD: Double
    let ILS: Double
    let KRW: Double
    let PLN: Double
}
