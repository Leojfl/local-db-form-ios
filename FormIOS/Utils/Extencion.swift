//
//  Extencion.swift
//  FormIOS
//
//  Created by Leonardo Flores Lopez on 14/01/21.
//

import UIKit
import RealmSwift


extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}

extension UITableView {
    
    /// Allow to add a message when UITableView doesn't have items
    func setEmptyMessage(_ message: String) {
        if self.visibleCells.isEmpty {
            let messageLbl = UILabel(frame: CGRect(
                x: 0,
                y: 0,
                width: self.bounds.size.width,
                height: self.bounds.size.height
            ))
            
            messageLbl.text = message
            messageLbl.textColor = .black
            messageLbl.numberOfLines = 0
            messageLbl.textAlignment = .center
            messageLbl.sizeToFit()
            
            self.backgroundView = messageLbl
            self.separatorStyle = .none
        }
    }
    
    func resetBackground() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
    func reloadData(_ emptyMessage: String, withAutoHeight: Bool = false) {
        reloadData()
        
        if visibleCells.isEmpty {
            setEmptyMessage(emptyMessage)
        } else {
            resetBackground()
        }
    }
}
