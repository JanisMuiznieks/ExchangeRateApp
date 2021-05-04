//
//  ExchangeRateViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit

class ExchangeRateViewController: UIViewController, UITableViewDataSource, PickCurrencyDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCurrencyButton: UIButton!
    
    var exchangeRates: [ExchangeRate] = []
    var currencyPairs: [(lhs: CurrencyCodeData, rhs: CurrencyCodeData)] = []
    
    private var pendingCurrency: CurrencyCodeData? = nil
    
    func pickedCurrency(_ selectedCurrency: CurrencyCodeData) {
        if let currency = pendingCurrency {
            let currencyPair = (currency, selectedCurrency)
            currencyPairs.append(currencyPair)
            
            pendingCurrency = nil
        } else {
            pendingCurrency = selectedCurrency
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if exchangeRates.count > 0 {
            self.tableView.isHidden = false
        } else {
            self.tableView.isHidden = true
        }
        return exchangeRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "exchangeCell", for: indexPath) as? ExchangeTableViewCell else {
            return UITableViewCell()
        }
        
        let exchangeRate = exchangeRates[indexPath.row]
        
        cell.firstCurrencyLabel?.text = "1 \(exchangeRate.fromCurrency)"
        cell.secondCurrencyLabel?.text = "\(exchangeRate.rate) \(exchangeRate.toCurrency)"
        
        let currencyPair = currencyPairs[indexPath.row]
        
        cell.firstCurrencyNameLabel?.text = currencyPair.lhs.fullName?.rawValue
        cell.secondCurrencyNameLabel?.text = currencyPair.rhs.fullName?.rawValue
        
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Exchange Rate"
        guard !currencyPairs.isEmpty else {
            return
        }
        
        let urlString = "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios"
        
        var components = URLComponents(string: urlString)
        var queryItems: [URLQueryItem] = []

        for currencyPair in currencyPairs {
            let pair = currencyPair.lhs.code + currencyPair.rhs.code
            queryItems.append(URLQueryItem(name: "pairs", value: pair))
        }
        
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            return
        }
        
        print("🛠 Created URL", url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("ERROR")
            } else {
                if let data = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Double]
                    
                        if let exchangeRates: [ExchangeRate] = jsonObject?.map({ currencyPair, exchangeRate in
                            let lhsCurrency = String(currencyPair.prefix(3))
                            let rhsCurrency = String(currencyPair.suffix(3))
                            
                            print("🛠 1 \(lhsCurrency) exchangeable for \(exchangeRate) \(rhsCurrency)")
                            
                            return ExchangeRate(fromCurrency: lhsCurrency, toCurrency: rhsCurrency, rate: exchangeRate)
                        }) {
                            self.exchangeRates = exchangeRates
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    } catch {
                        
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            exchangeRates.remove(at: indexPath.row)
            currencyPairs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currencyPairViewController = segue.destination as? CurrencyPairViewController {
            currencyPairViewController.delegate = self
        }
    }
}
