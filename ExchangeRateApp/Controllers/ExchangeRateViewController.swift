//
//  ExchangeRateViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit


class ExchangeRateViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "exchangeCell", for: indexPath) as? ExchangeTableViewCell else {
            return UITableViewCell()}
        
        cell.firstCurrencyLabel?.text = "1 EUR"
        cell.firstCurrencyNameLabel?.text = "Euros"
        cell.secondCurrencyLabel?.text = "1.144 USD"
        cell.secondCurrencyNameLabel?.text = "United States Dollar"
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios?pairs=EURUSD")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data{
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJson)
                    } catch {
                        
                    }
                }
            }
        }
        task.resume()
        // Do any additional setup after loading the view.
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
