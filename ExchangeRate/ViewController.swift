//
//  ViewController.swift
//  ExchangeRate
//
//  Created by Resul Emül on 10/27/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var CAD = 0.0
    var HKD = 0.0
    var ISK = 0.0
    var PHP = 0.0
    var DKK = 0.0
    var HUF = 0.0
    var CZK = 0.0
    var GBP = 0.0
    var RON = 0.0
    var SEK = 0.0
    var IDR = 0.0
    var INR = 0.0
    var BRL = 0.0
    var RUB = 0.0
    var HRK = 0.0
    var JPY = 0.0
    var THB = 0.0
    var CHF = 0.0
    var EUR = 0.0
    var MYR = 0.0
    var BGN = 0.0
    var TRY = 0.0
    var CNY = 0.0
    var NOK = 0.0
    var NZD = 0.0
    var ZAR = 0.0
    var USD = 0.0
    var MXN = 0.0
    var SGD = 0.0
    var AUD = 0.0
    var ILS = 0.0
    var KRW = 0.0
    var PLN = 0.0
    var currencies:[Double] = []
    var firstRow = 1
    var secondRow = 0
    var amount = "1"
    
    
    
    var choices = ["USD","EUR","GBP","CAD","HKD","ISK","PHP","DKK","HUF","CZK","RON","SEK","IDR","INR","BRL","RUB","HRK","JPY","THB","CHF","MYR","BGN","TRY","CNY","NOK","NZD","ZAR","MXN","SGD","AUD","ILS","KRW","PLN"]
    var pickerView = UIPickerView()
    var baseCurrencyString = "EUR"
    var convertCurrencyString = "USD"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            print(choices[row])
        if component == 0 {
            baseCurrencyString = choices[row]
            firstRow = row
        }else{
            convertCurrencyString = choices[row]
            secondRow = row
        }
        

    }
    
    @IBOutlet weak var baseCurrency: UIButton!
    
    @IBOutlet weak var convertingCurrency: UIButton!
    
    @IBOutlet weak var switchCurrency: UIButton!
    
    @IBOutlet weak var convertedCurrencyAmount: UILabel!
    
    @IBOutlet weak var convertedCurrency: UILabel!
    
    @IBOutlet weak var baseCurencyButtonChange: UIButton!
    
    @IBOutlet weak var update: UIButton!
    
    
    var rates: Rate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencies = [USD,EUR,GBP,CAD,HKD,ISK,PHP,DKK,HUF,CZK,RON,SEK,IDR,INR,BRL,RUB,HRK,JPY,THB,CHF,MYR,BGN,TRY,CNY,NOK,NZD,ZAR,MXN,SGD,AUD,ILS,KRW,PLN]
        performRequest(urlString: "https://api.exchangeratesapi.io/latest?base=USD")
        baseCurrencyString = choices[firstRow]
        convertCurrencyString = choices[secondRow]

        baseCurrency.setTitle(baseCurrencyString, for: .normal)
        convertingCurrency.setTitle(convertCurrencyString, for: .normal)
        convertedCurrency.text = convertCurrencyString
        baseCurencyButtonChange.setTitle(String("1 \(baseCurrencyString)= "), for: .normal)
        convertedCurrencyAmount.text = String(format:"%.2f", currencies[secondRow]/currencies[firstRow])

        convertedCurrencyAmount.widthAnchor.constraint(equalToConstant: convertedCurrencyAmount.layer.frame.width).isActive = true
        convertedCurrencyAmount.adjustsFontSizeToFitWidth = true
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error as Any)
                    return
                }
                if let safeData = data {
                    self.parseJason(rateData: safeData)
                    print(safeData)
                    
                }
            }
            task.resume()
        }
        
    }
    
    func parseJason(rateData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ExchangeData.self, from: rateData)
            CAD = decodedData.rates.CAD
            HKD = decodedData.rates.HKD
            ISK = decodedData.rates.ISK
            PHP = decodedData.rates.PHP
            DKK = decodedData.rates.DKK
            HUF = decodedData.rates.HUF
            CZK = decodedData.rates.CZK
            GBP = decodedData.rates.GBP
            RON = decodedData.rates.RON
            SEK = decodedData.rates.SEK
            IDR = decodedData.rates.IDR
            INR = decodedData.rates.INR
            BRL = decodedData.rates.BRL
            RUB = decodedData.rates.RUB
            HRK = decodedData.rates.HRK
            JPY = decodedData.rates.JPY
            THB = decodedData.rates.THB
            CHF = decodedData.rates.CHF
            EUR = decodedData.rates.EUR
            MYR = decodedData.rates.MYR
            BGN = decodedData.rates.BGN
            TRY = decodedData.rates.TRY
            CNY = decodedData.rates.CNY
            NOK = decodedData.rates.NOK
            NZD = decodedData.rates.NZD
            ZAR = decodedData.rates.ZAR
            USD = decodedData.rates.USD
            MXN = decodedData.rates.MXN
            SGD = decodedData.rates.SGD
            AUD = decodedData.rates.AUD
            ILS = decodedData.rates.ILS
            KRW = decodedData.rates.KRW
            PLN = decodedData.rates.PLN
            currencies = [USD,EUR,GBP,CAD,HKD,ISK,PHP,DKK,HUF,CZK,RON,SEK,IDR,INR,BRL,RUB,HRK,JPY,THB,CHF,MYR,BGN,TRY,CNY,NOK,NZD,ZAR,MXN,SGD,AUD,ILS,KRW,PLN]
            
        } catch {
            print(error)
        }
        DispatchQueue.main.async {[self] in
            convertedCurrencyAmount.text = String(format:"%.2f", currencies[secondRow]*Double(amount)!/currencies[firstRow])
        }

    }
    

    
    @IBAction func calculateAmount(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enter Amount", message: nil, preferredStyle: .alert)
        alert.addTextField { (UITextField) in
            UITextField.keyboardType = .decimalPad
        }
        alert.addAction(UIAlertAction(title: "Calculate", style: .default, handler: { [unowned self](UIAlertAction) in
            if let amount = alert.textFields?.first?.text{
                if baseCurrency.titleLabel?.text == nil {return}
                self.amount = amount
                baseCurrency.setTitle(baseCurrencyString, for: .normal)
                convertingCurrency.setTitle(convertCurrencyString, for: .normal)
                convertedCurrency.text = convertCurrencyString
                baseCurencyButtonChange.setTitle(String("\(amount) \(baseCurrencyString)= "), for: .normal)
                convertedCurrencyAmount.text = String(format:"%.2f", currencies[secondRow]*(Double(amount)!)/currencies[firstRow])
                
                print("\(amount) \(baseCurrency.titleLabel!.text!)")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)

    }
    
    
    @IBAction func changeCurrency(_ sender: UIButton) {
        let alert = UIAlertController(title: "Select Currencies", message: "\n\n\n\n\n\n", preferredStyle: .alert)
               
               let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
               
               alert.view.addSubview(pickerFrame)
               pickerFrame.dataSource = self
               pickerFrame.delegate = self
        
        pickerFrame.selectRow(firstRow, inComponent: 0, animated: true)
        pickerFrame.selectRow(secondRow, inComponent: 1, animated: true)
               
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[unowned self] (UIAlertAction) in
                baseCurrency.setTitle(baseCurrencyString, for: .normal)
                convertingCurrency.setTitle(convertCurrencyString, for: .normal)
                convertedCurrency.text = convertCurrencyString
                baseCurencyButtonChange.setTitle(String("1 \(baseCurrencyString)= "), for: .normal)
                convertedCurrencyAmount.text = String(format:"%.2f", currencies[secondRow]/currencies[firstRow])
                amount = "1"
               }))
        print(firstRow)

        self.present(alert,animated: true, completion:nil )
        
    }
    
    @IBAction func currencySwitchTapped(_ sender: UIButton) {
        
        let cont = baseCurrencyString
        baseCurrencyString = convertCurrencyString
        convertCurrencyString = cont
        
        let con = firstRow
        firstRow = secondRow
        secondRow = con
        
        
        
        baseCurrency.setTitle(baseCurrencyString, for: .normal)
        convertingCurrency.setTitle(convertCurrencyString, for: .normal)
        convertedCurrency.text = convertCurrencyString
        baseCurencyButtonChange.setTitle(String("\(amount) \(baseCurrencyString)= "), for: .normal)
        convertedCurrencyAmount.text = String(format:"%.2f", currencies[secondRow]*(Double(amount)!)/currencies[firstRow])
    }
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        print(currencies[secondRow]*(Double(amount)!)/currencies[firstRow])
        performRequest(urlString: "https://api.exchangeratesapi.io/latest?base=USD")
        baseCurrencyString = choices[firstRow]
        convertCurrencyString = choices[secondRow]

        baseCurrency.setTitle(baseCurrencyString, for: .normal)
        convertingCurrency.setTitle(convertCurrencyString, for: .normal)
        convertedCurrency.text = convertCurrencyString
        baseCurencyButtonChange.setTitle(String("\(amount) \(baseCurrencyString)= "), for: .normal)
        print(currencies[secondRow]*(Double(amount)!)/currencies[firstRow])
         convertedCurrencyAmount.text = String(format:"%.2f", currencies[secondRow]*(Double(amount)!)/currencies[firstRow])
        



        UIView.animate(withDuration: 1) {
          self.update.transform = self.update.transform.rotated(by: CGFloat.pi)
          self.update.transform = self.update.transform.rotated(by: CGFloat.pi)
          self.update.transform = self.update.transform.rotated(by: CGFloat.pi)
          self.update.transform = self.update.transform.rotated(by: CGFloat.pi)
          self.update.transform = self.update.transform.rotated(by: CGFloat.pi)
          self.update.transform = self.update.transform.rotated(by: CGFloat.pi)
        }

        
        
    }
    

    
}

