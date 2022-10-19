//
//  CofiguringCellProtocol.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 19.10.22.
//

import Foundation



protocol ConfiguringCell {
    static var reuseId: String { get }
    func configure(with itemIdentifier: Int)
}
