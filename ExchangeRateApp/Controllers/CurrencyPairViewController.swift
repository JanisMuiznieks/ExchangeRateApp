//
//  CurrencyPairViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit


class CurrencyPairViewController: UIViewController {

    var currency: [Currency] = []
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Currency Pair"
        
    }
    


// MARK: UITableViewDataSource

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
    }
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return currency.count
    
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCurrencyCell", for: indexPath) as? CurrencyTableViewCell else {
        return UITableViewCell()}
    
    let item = currency[indexPath.row]
    cell.currencyAbriviationLabel?.text = "USD"
    cell.countryLabel?.text = item.currencyDescription
   
    
    return cell


    }
}
