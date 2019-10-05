//
//  CheckoutView.swift
//  iDIne
//
//  Created by Pavan Powani on 05/10/19.
//  Copyright © 2019 Pavan Powani. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine points"]
    static let tipAmounts = [5, 10, 15, 20, 0]

    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tip = 1
    @State private var showingPaymentAlert = false

    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = Double(Self.tipAmounts[tip]) * (total / 100)

        return total + tipValue
    }

    var body: some View {
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you want to pay")) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                if addLoyaltyDetails {
                    TextField("Enter your iDine id", text: $loyaltyNumber)
                }
            }

            Section(header: Text("Add a tip?")) {
                Picker(selection: $tip, label: Text("Percentage:")) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Total: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }

        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed!"), message: Text("Your order was \(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("Okay")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
