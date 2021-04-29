//
//  CurrencyPairViewController.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit

protocol PickCurrencyDelegate {
    func pickCurrencyPair(code: String, fullName: String, currency: String)
}


class CurrencyPairViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var isTapped: Bool = false
    var selectedCellPath: IndexPath?
    
    var array1: [Code] = []
    var delegate: PickCurrencyDelegate?
    var currency: [CurrencyCodeData] = []
    var someString: [String] = [CurrencyCode.eur.rawValue]
    var lastSelectedIndexPath = [[IndexPath.init(row: 0, section: 0)], [IndexPath.init(row: 0, section: 1)]]
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
        cell.countryFlagImageView.layer.cornerRadius = cell.countryFlagImageView.frame.height / 2
        cell.countryFlagImageView.layer.masksToBounds = false
        cell.countryFlagImageView.clipsToBounds = true
        cell.countryFlagImageView.layer.borderWidth = 1
    return cell


    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = currency[indexPath.row]
        isTapped = true
        selectedCellPath = indexPath
        if isTapped {
            print("First Currency Pair Selected Cell:", indexPath)
            print("First Content:", item.code)
            array1.append(Code(code: item.code, fullName: item.fullName!.rawValue, currency: ""))
            tableView.reloadData()
            print(array1 )
            guard let vc = navigationController?.viewControllers.first as? ExchangeRateViewController else {return}
                            vc.exchange.append(Code(code: item.code, fullName: item.fullName!.rawValue, currency: ""))
            if array1.count == 1 {
                currency.remove(at: indexPath.row)
                tableView.reloadData()
            }
            if array1.count == 2 {
                self.navigationController?.popViewController(animated: true)
                
            }
            isTapped = false
            
            
        }
//        tableView.reloadRows(at: [indexPath], with: .none)
//        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
//        let nextVC = ExchangeRateViewController()
//        nextVC.title = "\(title ?? "Exchange Rate")"
//        nextVC.tableView = self.tableView
//        self.navigationController?.pushViewController(nextVC, animated: true)
//        tableView.deselectRow(at: indexPath, animated: true)
//        let cell = tableView.cellForRow(at: indexPath)
//
//        if !self.lastSelectedIndexPath[indexPath.section].contains(indexPath){
//            cell?.accessoryType = .checkmark
//            self.lastSelectedIndexPath[indexPath.section].removeAll()
//            self.lastSelectedIndexPath[indexPath.section].append(indexPath)
//            tableView.reloadData()
//        }
        tableView.reloadData()
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
