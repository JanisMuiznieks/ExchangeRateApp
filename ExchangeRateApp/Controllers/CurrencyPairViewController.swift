//
//  CurrencyPairViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit

protocol PickCurrencyDelegate: AnyObject {
    func pickedCurrency(_: CurrencyCodeData)
}

class CurrencyPairViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
<<<<<<< HEAD
    weak var delegate: PickCurrencyDelegate?
    var currencies: [CurrencyCodeData] = []
    var selectedCurrencies: [CurrencyCodeData] = []
    
=======
>>>>>>> 7dcbd6e31b5e4b9dcf36805229b7ed1765b9e874
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: PickCurrencyDelegate?
    var currencies: [CurrencyCodeData] = []
    var selectedCurrencies: [CurrencyCodeData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
        if let path = Bundle.main.path(forResource: "Currencies", ofType: "json") {
                    let dataArray = try! JSONSerialization.jsonObject(
                            with: Data(contentsOf: URL(fileURLWithPath: path)),
                            options: JSONSerialization.ReadingOptions()
                    ) as! [String]
                    
=======
        title = "Currency Pair"
        
        if let path = Bundle.main.path(forResource: "Currencies", ofType: "json"),
            let dataArray = try? JSONSerialization.jsonObject(
                with: Data(contentsOf: URL(fileURLWithPath: path))
            ) as? [String] {
            
>>>>>>> 7dcbd6e31b5e4b9dcf36805229b7ed1765b9e874
            for data in dataArray {
                currencies.append(CurrencyCodeData(code: data))
            }
        }
    }
<<<<<<< HEAD
   
    

// MARK: UITableViewDataSource

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    currencies.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? CurrencyTableViewCell else {
        return UITableViewCell()}
        let item = currencies[indexPath.row]
   
=======
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? CurrencyTableViewCell else {
            return UITableViewCell()
        }
        
        let item = currencies[indexPath.row]
        
>>>>>>> 7dcbd6e31b5e4b9dcf36805229b7ed1765b9e874
        cell.currencyAbriviationLabel?.text = item.code
        cell.countryLabel?.text = item.fullName.map { $0.rawValue }
        cell.countryFlagImageView.image = item.flag
        cell.countryFlagImageView.layer.cornerRadius = cell.countryFlagImageView.frame.height / 2
        cell.countryFlagImageView.clipsToBounds = true
        cell.countryFlagImageView.layer.borderWidth = 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = currencies[indexPath.row]
        
        print("First Currency Pair Selected Cell:", indexPath)
        print("First Content:", item.code)
<<<<<<< HEAD
          
        delegate?.pickedCurrency(item)
        selectedCurrencies.append(item)
=======
        
        delegate?.pickedCurrency(item)
        
        selectedCurrencies.append(item)
        
>>>>>>> 7dcbd6e31b5e4b9dcf36805229b7ed1765b9e874
        if selectedCurrencies.count == 1 {
            currencies.remove(at: indexPath.row)
            tableView.reloadData()
        } else if selectedCurrencies.count == 2 {
<<<<<<< HEAD
               navigationController?.popViewController(animated: true)
            }
=======
            navigationController?.popViewController(animated: true)
        }
>>>>>>> 7dcbd6e31b5e4b9dcf36805229b7ed1765b9e874
    }
}
