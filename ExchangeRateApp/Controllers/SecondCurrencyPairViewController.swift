//
//  SecondCurrencyPairViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 21/04/2021.
//

import UIKit

class SecondCurrencyPairViewController: UIViewController, UITableViewDataSource {
    
    
    var currency: [CurrencyCodeData] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currency.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCurrencyCell", for: indexPath) as? SecondCurrencyTableViewCell else {
                return UITableViewCell()}
            let item = currency[indexPath.row]
            cell.CountryFlagImageView.image = item.flag
            cell.CurrencyAbriviationLabel.text = item.code
            cell.CountryLabel.text = item.fullName.map { $0.rawValue }
            return cell
        }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
