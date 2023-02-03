//
//  ColorMap.swift
//  Pokedex
//
//  Created by Felipe Domingos on 03/02/23.
//

import UIKit

class ColorMap {
    
    static func color(for string: String) -> UIColor {
        
        switch string {
            
        case "electric": return UIColor(red: 1.0, green: 0.76, blue: 0.0, alpha: 1.0)
        case "grass": return UIColor(red: 0.47, green: 0.67, blue: 0.19, alpha: 1.0)
        case "normal": return UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1.0)
        case "fire": return UIColor(red: 1.0, green: 0.35, blue: 0.0, alpha: 1.0)
        case "water": return UIColor(red: 0.0, green: 0.45, blue: 0.74, alpha: 1.0)
        case "flying": return UIColor(red: 0.89, green: 0.94, blue: 1.0, alpha: 1.0)
        case "fighting": return UIColor(red: 0.27, green: 0.0, blue: 0.0, alpha: 1.0)
        case "poison": return UIColor(red: 0.46, green: 0.0, blue: 0.51, alpha: 1.0)
        case "ground": return UIColor(red: 0.52, green: 0.39, blue: 0.26, alpha: 1.0)
        case "rock": return UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        case "psychic": return UIColor(red: 0.64, green: 0.14, blue: 0.72, alpha: 1.0)
        case "ice": return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case "bug": return UIColor(red: 0.36, green: 0.74, blue: 0.36, alpha: 1.0)
        case "ghost": return UIColor(red: 0.45, green: 0.26, blue: 0.59, alpha: 1.0)
        case "dragon": return UIColor(red: 0.12, green: 0.47, blue: 0.71, alpha: 1.0)
        case "dark": return UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1.0)
        case "fairy": return UIColor(red: 0.97, green: 0.56, blue: 0.76, alpha: 1.0)
        case "steel": return UIColor(red: 0.55, green: 0.57, blue: 0.58, alpha: 1.0)
        default: return .blue
        }
    }
    
    static func colorText(for string: String) -> UIColor {
        
        switch string {
            
        case "electric": return .black
        case "grass": return .black
        case "normal": return .black
        case "fire": return .black
        case "water": return .white
        case "flying": return .black
        case "fighting": return .white
        case "poison": return .white
        case "ground": return .white
        case "rock": return .black
        case "psychic": return .white
        case "ice": return .black
        case "bug": return .black
        case "ghost": return .white
        case "dragon": return .white
        case "dark": return .white
        case "fairy": return .black
        case "steel": return .black
        default: return .systemPink
        }
    }
}
