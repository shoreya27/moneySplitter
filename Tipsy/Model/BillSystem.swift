//
//  BillSystem.swift
//  Tipsy
//
//  Created by user197822 on 5/30/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct BillSystem{
    var tip : String = ""
    var tipValue : Double = 0.0
    var people : Int = 2
    var billAmount : Double = 0.0
    
    mutating func getZeroPercButtonStatus() -> Bool{
        if tip == "0%"{
            tipValue = 0.0
            return true
        }
        return false
    }
    mutating func getTenPercButtonStatus() -> Bool{
        if tip == "10%"{
            tipValue = 0.1
            return true
        }
        return false
    }
    mutating func getTwentyPercButtonStatus() -> Bool{
        if tip == "20%"{
            tipValue = 0.2
            return true
        }
        return false
    }
    
    func getTipValue() -> Double{
        return tipValue
    }
    
    mutating func setPeople(_ toBeSplit: Int){
        people = toBeSplit
    }
    
    func getSplitValue() -> String {
        return String(people)
    }
    
    mutating func setBillAmount(_ bill:Double){
        billAmount = bill
    }
    
    func getResult() ->String {
        //calculate tip amount
        let tipAmount = billAmount * tipValue
        //add tip amount to total bill
        let totalBill = billAmount + tipAmount
        //divide total bill by no. of people
        let splitAmount = totalBill / Double(people)
        
        return String(format: "%.2f", splitAmount)
    }
    
}
