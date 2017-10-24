//
//  StoreManager.swift
//  Buoy
//
//  Created by Thanh-Tam Le on 8/30/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import StoreKit

class StoreManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    private static var sharedInstance: StoreManager!

    static func getInstance() -> StoreManager {
        if(sharedInstance == nil) {
            sharedInstance = StoreManager()
        }
        return sharedInstance
    }

    private override init() {
        super.init()

        requestProductInfo()
    }

    var completionHandler: (Bool, String)->Void = {_,_ in }

    private let NON_CONSUMABLE_PRODUCT_ID = "Budget_Buoy_Non_Consumable"
    private let CONSUMABLE_PRODUCT_ID = "Budgets_Consumable"

    private var productID = ""
    private var productsRequest = SKProductsRequest()
    private var iapProducts = [SKProduct]()

    private func requestProductInfo() {
        if SKPaymentQueue.canMakePayments() {
            let productIdentifiers = NSSet(array: [NON_CONSUMABLE_PRODUCT_ID, CONSUMABLE_PRODUCT_ID])
            let productRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)

            productRequest.delegate = self
            productRequest.start()
        }
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        iapProducts = response.products
    }

    func purchaseProductForNonCusumable(completion: @escaping (Bool, String) -> Void) {

        if iapProducts.count == 0 {
            completion(false, "Oh no!\nYour payment didn't go through.\nPlease try again.")
            return
        }

        completionHandler = completion

        for product in iapProducts {
            if product.productIdentifier == NON_CONSUMABLE_PRODUCT_ID {
                purchaseMyProduct(product: product)
                break
            }
        }
    }

    func purchaseProductForCusumable(completion: @escaping (Bool, String) -> Void) {

        if iapProducts.count == 0 {
            completion(false, "Oh no!\nYour payment didn't go through.\nPlease try again.")
            return
        }

        completionHandler = completion

        for product in iapProducts {
            if product.productIdentifier == CONSUMABLE_PRODUCT_ID {
                purchaseMyProduct(product: product)
                break
            }
        }
    }

    func purchaseMyProduct(product: SKProduct) {
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)

            productID = product.productIdentifier
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

        for transaction:AnyObject in transactions {
            if let trans = transaction as? SKPaymentTransaction {
                switch trans.transactionState {
                case .purchased:
                    completionHandler(true, "Success!\nYour payment has been accepted.\nHappy Budgeting :)")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break

                case .failed:
                    completionHandler(false, "Oh no!\nYour payment didn't go through.\nPlease try again.")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                case .restored:
                    completionHandler(false, "Oh no!\nYour payment didn't go through.\nPlease try again.")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                default:
                    break
                }
            }
        }
    }
}
