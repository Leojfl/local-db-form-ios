//
//  FormViewController.swift
//  FormIOS
//
//  Created by Leonardo Flores Lopez on 13/01/21.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var tfName: MDCTextFieldCustom!
    @IBOutlet weak var tfLastName: MDCTextFieldCustom!
    @IBOutlet weak var tfEmail: MDCTextFieldCustom!
    @IBOutlet weak var tfSecondLastName: MDCTextFieldCustom!
    @IBOutlet weak var tfPhone: MDCTextFieldCustom!
    @IBOutlet weak var btnLoadData: MDCButtonCustom!
    
    private var lastUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getLastUser()
    }
    
    @IBAction func onClickAction(_ sender: Any) {
        if let lastUser = lastUser {
            tfName.text = lastUser.name
            tfLastName.text = lastUser.lastName
            tfEmail.text = lastUser.email
            tfSecondLastName.text = lastUser.secondLastName
            tfPhone.text = lastUser.phone
        }
    }
    
    @IBAction func onClickSave(_ sender: Any) {
        if isValid() {
            let storyboard = UIStoryboard(name: "Commons", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ProgressDialogViewController") as! ProgressDialogViewController
            self.navigationController?.present(vc, animated: true)
        
            let user = User()
            user.name = tfName.text!
            user.lastName = tfLastName.text!
            user.secondLastName = tfSecondLastName.text!
            user.email = tfEmail.text!
            user.phone = tfPhone.text!
            lastUser = user
            User.save(user: user){ result in
                vc.dismiss(animated: true){
                    var title = "Ups"
                    var message = "Por el momento no se pude guardar su informació"
                    if result {
                        message = "Información guardada correctamente"
                        title = "Correcto"
                        self.btnLoadData.isHidden = false
                        self.clearTextFields()
                    }
                    UIUtils.showAlert(controller: self, title: title, message: message)
                }
            }
        }
    }
    
    private func setupUI(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        tfName.setLeftIcon(#imageLiteral(resourceName: "ic_user"))
        tfLastName.setLeftIcon(#imageLiteral(resourceName: "ic_user"))
        tfSecondLastName.setLeftIcon(#imageLiteral(resourceName: "ic_user"))
        tfEmail.setLeftIcon(#imageLiteral(resourceName: "ic_email"))
        tfPhone.setLeftIcon(#imageLiteral(resourceName: "ic_phone"))
    }
    
    //
    
    private func isValid() -> Bool{
        var isValid: Bool = true
        isValid = tfName.required(error: "El nombre es requerido") && isValid
        isValid = tfLastName.required(error: "El apellido paterno es requerido") && isValid
        isValid = tfSecondLastName.required(error: "El apellido materno es requerido") && isValid
        
        isValid = tfEmail.required(error: "El correo electrónico es requerido ") && isValid
        isValid = tfEmail.email(error: "Correo electrónico no válido ") && isValid
        
        isValid = tfPhone.required(error: "El teléfono celular es requerido") && isValid
        isValid = tfPhone.phone(error: "Teléfono celular no válido") && isValid
        
        return isValid
    }
    private func clearTextFields(){
        tfName.text = ""
        tfLastName.text = ""
        tfEmail.text = ""
        tfSecondLastName.text = ""
        tfPhone.text = ""
    }
    
    private func getLastUser(){
        User.getLastUser { lastUser in
            self.lastUser = lastUser
            if lastUser != nil {
                self.btnLoadData.isHidden = false
            }
        }
    }

}
