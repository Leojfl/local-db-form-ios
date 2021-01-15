//
//  UserTableViewCell.swift
//  FormIOS
//
//  Created by Leonardo Flores Lopez on 14/01/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblSecondLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    public func setupUI(user: User){
        lblName.text  = user.name
        lblLastName.text  = user.lastName
        lblSecondLastName.text  = user.secondLastName
        lblEmail.text  = user.email
        lblPhone.text  = user.phone        
    }
    
}
