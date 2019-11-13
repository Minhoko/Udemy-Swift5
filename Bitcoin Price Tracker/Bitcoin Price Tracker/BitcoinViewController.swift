//
//  BitcoinViewController.swift
//  Bitcoin Price Tracker
//
//  Created by Minho on 13/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class BitcoinViewController: UIViewController {
    @IBOutlet weak var usdPriceLabel: UILabel!
    @IBOutlet weak var euroPriceLabel: UILabel!
    @IBOutlet weak var yenPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let usdDefault = UserDefaults.standard.string(forKey: "USD") {
            usdPriceLabel.text = usdDefault
        }
        
        if let eurDefault = UserDefaults.standard.string(forKey: "EUR") {
            euroPriceLabel.text = eurDefault
        }
        
        if let yenDefault = UserDefaults.standard.string(forKey: "JPY") {
            yenPriceLabel.text = yenDefault
        }
        
        
        callBitcoinAPI()
    }
    
    func callBitcoinAPI() {
        let sourceUrl = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"
        
        if let url = URL(string: sourceUrl) {
            URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error == nil {
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Double]{
                            DispatchQueue.main.async {
                                self.renderPriceLabels(prices: json)
                            }
                        }
                    }
                } else {
                    print("error is here")
                }
            }.resume()
        }
    }
    
    func renderPriceLabels(prices: [String: Double]) {
        if let usdPrice = prices["USD"] {
            let formattedUsdPrice = getNumberFormatter(price: usdPrice, currencyCode: "USD")
            usdPriceLabel.text = formattedUsdPrice
            UserDefaults.standard.set(formattedUsdPrice + "~", forKey: "USD")
        }
        
        if let euroPrice = prices["EUR"] {
            let formattedEuroPrice = getNumberFormatter(price: euroPrice, currencyCode: "EUR")
            euroPriceLabel.text = formattedEuroPrice
            UserDefaults.standard.set(formattedEuroPrice + "~", forKey: "EUR")
        }
        
        if let yenPrice = prices["JPY"] {
            let formattedYenPrice = getNumberFormatter(price: yenPrice, currencyCode: "JPY")
            yenPriceLabel.text = formattedYenPrice
            UserDefaults.standard.set(formattedYenPrice + "~", forKey: "JPY")
        }
    }
    
    func getNumberFormatter(price: Double, currencyCode: String) -> String {
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        
        if let priceString = formatter.string(from: NSNumber(value: price)) {
            return priceString
        }
       
        return "Error"
    }
    
    
    @IBAction func refreshTapped(_ sender: Any) {
        callBitcoinAPI()
    }
    
    
}

