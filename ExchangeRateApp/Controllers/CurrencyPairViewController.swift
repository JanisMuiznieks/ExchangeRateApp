//
//  CurrencyPairViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit


class CurrencyPairViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var currency: [CurrencyCodeData] = []
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Currency Pair"
        
        if let path = Bundle.main.path(forResource: "Currencies", ofType: "json") {
                    let dataArray = try! JSONSerialization.jsonObject(
                            with: Data(contentsOf: URL(fileURLWithPath: path)),
                            options: JSONSerialization.ReadingOptions()
                    ) as! [String]
                    
            for rawData in dataArray {
                let data = rawData
                currency.append(CurrencyCodeData(code: data, fullName: "", flag: UIImage(named: "EUR")!))
            }
        }
    }
    
    

// MARK: UITableViewDataSource

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return currency.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? CurrencyTableViewCell else {
        return UITableViewCell()}
    
    let item = currency[indexPath.row]
    cell.currencyAbriviationLabel?.text = item.code
    cell.countryLabel?.text = item.fullName.map { $0.rawValue }
    cell.countryFlagImageView.image = item.flag
   
    
    return cell


    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        let destination: SecondCurrencyPairViewController = segue.destination as! SecondCurrencyPairViewController
//        // Pass the selected object to the new view controller.
//        destination.tableView = tableView
//    }
}
