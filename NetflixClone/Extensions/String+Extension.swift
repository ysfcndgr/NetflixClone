//
//  String+Extension.swift
//  NetflixClone
//
//  Created by Can on 28.01.2024.
//

import Foundation

extension String {
    func capilatizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
