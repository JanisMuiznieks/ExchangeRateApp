//
//  ExchangeRateViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit


class ExchangeRateViewController: UIViewController, UITableViewDataSource, PickCurrencyDelegate{
    func pickCurrencyPair(code: String, fullName: String, currency: String) {
        exchange.append(Code(code: code, fullName: fullName, currency: currency))
    }
    
    
    var currency: [CurrencyCodeData] = []
    var exchange: [Code] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exchange.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "exchangeCell", for: indexPath) as? ExchangeTableViewCell else {
            return UITableViewCell()}

        let item = exchange[indexPath.row]
        
        cell.firstCurrencyLabel?.text = "1 \(item.code)"
        cell.firstCurrencyNameLabel?.text = item.fullName
        cell.secondCurrencyLabel?.text = "\(item.currency) \(item.code)"
        cell.secondCurrencyNameLabel?.text = item.fullName
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        print(array1)
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("array1: \(exchange)")
        
        let partOne =  "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios?pairs=EURUSD"
        let firstCode = ""
        let secondCode = ""
        guard let url = URL(string: partOne + firstCode + secondCode) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data{
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJson)
                        
                        let currency = "\(myJson)"
                        let startIndex = currency.index(currency.startIndex, offsetBy: 16)
                        let endIndex = currency.index(currency.startIndex, offsetBy: 21)
                        let currencyString = String(currency[startIndex...endIndex])
                        self.exchange.append(Code(code: "", fullName: "", currency: currencyString))
                        print(currencyString)
                        } catch {
                        
                    }
                }
            }
        }
        task.resume()
        
        
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
