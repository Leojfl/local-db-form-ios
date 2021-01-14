//
//  User.swift
//  FormIOS
//
//  Created by Leonardo Flores Lopez on 12/01/21.
//

import UIKit

// Ejemplo de 
enum ElementType {    case fire
    case water
    case normal
}

struct Attributes {
    var attack:  Int64  = 0
    var defence: Int64  = 0
}


class Warrior: Human, Actions {
    
    var elementType: ElementType
    var attributes: Attributes
    
    init(elementType: ElementType, attributes: Attributes) {
        self.elementType = elementType
        self.attributes  = attributes
    }
    
    func onAttack(enemy: Warrior) {
        
        var danger = enemy.attributes.attack
        
        if self.elementType == .fire && enemy.elementType == .water  {
            danger = enemy.attributes.attack * 2
        }
        
        if self.elementType == .water && enemy.elementType == .fire  {
            danger = enemy.attributes.attack / 2
        }
        
        self.health -=  (self.attributes.defence - danger)
        
    }
}

class Human {
    var name:   String = ""
    var age:    Int64  = 18
    var health: Int64  = 100
}

protocol Actions {
    func onAttack(enemy: Warrior)
}


func area(radius: Double) -> Double {
    let pi = 3.14
    return pi * pow(radius, 2)
}
