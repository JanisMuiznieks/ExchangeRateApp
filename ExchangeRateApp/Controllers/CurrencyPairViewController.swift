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
    
    weak var delegate: PickCurrencyDelegate?
    var currencies: [CurrencyCodeData] = []
    var selectedCurrencies: [CurrencyCodeData] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Currency Pair"
        
        if let path = Bundle.main.path(forResource: "Currencies", ofType: "json") {
                    let dataArray = try! JSONSerialization.jsonObject(
                            with: Data(contentsOf: URL(fileURLWithPath: path)),
                            options: JSONSerialization.ReadingOptions()
                    ) as! [String]
                    
            for data in dataArray {
                currencies.append(CurrencyCodeData(code: data))
            }
        }
    }
   
    

// MARK: UITableViewDataSource

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    currencies.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? CurrencyTableViewCell else {
        return UITableViewCell()}
        let item = currencies[indexPath.row]
   
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
          
        delegate?.pickedCurrency(item)
        selectedCurrencies.append(item)
        if selectedCurrencies.count == 1 {
            currencies.remove(at: indexPath.row)
            tableView.reloadData()
        } else if selectedCurrencies.count == 2 {
               navigationController?.popViewController(animated: true)
            }
    }
    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
//        let destination: ExchangeRateViewController = segue.destination as! Ex
        // Pass the selected object to the new view controller.
//        destination.urlString = webURLString
//    }
}
