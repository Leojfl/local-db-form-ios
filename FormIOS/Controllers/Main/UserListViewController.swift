//
//  UserListViewController.swift
//  FormIOS
//
//  Created by Leonardo Flores Lopez on 14/01/21.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getUsers()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupUI() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        setupTable()
    }
    
    private func setupTable() {
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView()
        table.reloadData("Sin usuarios")
        table.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    private func getUsers(){
        User.getUsers { users in
            self.users = users
            self.table.reloadData("Sin usuarios")
        }
    }
    
}
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        tableViewCell.setupUI(user: self.users[indexPath.row])
        
        
        return tableViewCell
    }

}
