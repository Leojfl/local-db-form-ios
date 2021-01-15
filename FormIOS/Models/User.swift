//
//  User.swift
//  FormIOS
//
//  Created by Leonardo Flores Lopez on 12/01/21.
//

import UIKit
import RealmSwift

class User: Object {
    
    @objc dynamic var name:     String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var secondLastName: String = ""
    @objc dynamic var phone:    String = ""
    @objc dynamic var email:    String = ""
    
    public static func save(user: User, completion: @escaping (_ result: Bool) -> Void) {
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.add(user)
                completion(true)
                return
            }
        } catch {
            NSLog("DB error: \(String(describing: error))")
            completion(false)
        }
    }
    
    public static func getLastUser(completion: @escaping (_ data: User?) -> Void) {
        let realm = try! Realm()
        let lastUser = realm.objects(User.self).last
        completion(lastUser)
    }
    
    public static func getUsers(completion: @escaping (_ data: [User]) -> Void) {
        let realm = try! Realm()
        let users = realm.objects(User.self).toArray(ofType: User.self)
        completion(users)
    }
    
    
}
