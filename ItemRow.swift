//
//  ItemRow.swift
//  iDIne
//
//  Created by Pavan Powani on 05/10/19.
//  Copyright © 2019 Pavan Powani. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    var body: some View {
        Text(item.name)
    }
}
