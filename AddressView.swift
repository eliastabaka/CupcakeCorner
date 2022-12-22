//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Miłosz Tabaka on 21/12/2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.data.name)
                TextField("Street Address", text: $order.data.streetAddress)
                TextField("City", text: $order.data.city)
                TextField("Zip", text: $order.data.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.data.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
