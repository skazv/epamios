//
//  Data.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//
import UIKit

struct Trainer {
    let fullName: String
    let photo: UIImage?
}

struct GymClass {
    let name: String
    let day: String
    let time: String
    let duration: String
    let trainer: Trainer
    var isRegistered: Bool
}
