//
//  ShoppingCart.swift
//  Nike Collection
//
//  Created by Bobby Negoat on 1/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class ShoppingCart {
    
    var items = [(product: Product, qty: Int)]()
    static let sharedInstance = ShoppingCart()
    private init() {}
    
}//ShoppingCart class over line

//custom functions
extension ShoppingCart{
    
     internal func add(product: Product, qty: Int) {
        
// Check if a product already exists in the shopping cart
        if let index = find(product: product) {
            
// If already exists in the shopping cart, add the qty to the current qty
let newQty = items[index].qty + qty;items[index] = (product, newQty)}else {
            
// If not yet exists in the shopping cart, add the product with the qty to items array
            items.append((product, qty))
        }
    }
    
    internal func update(product: Product, qty: Int) {
        if let index = find(product: product) {
            items[index] = (product, qty)
        }
    }
    
    internal func delete(product: Product) {
        if let index = find(product: product) {
            items.remove(at: index)
        }
    }
    
    internal func totalItem() -> Int {
        var totalItem = 0
        
        for item in items {
            totalItem += item.qty
        }
        return totalItem
    }
    
    internal func totalItemCost() -> Double {
        var totalCost: Double = 0.0
        
        for item in items {
totalCost += Double(item.qty) * item.product.salePrice
        }
        return totalCost
    }
    
    private func find(product: Product) -> Int? {
let index = items.index(where: { $0.product == product })
        return index
    }
}