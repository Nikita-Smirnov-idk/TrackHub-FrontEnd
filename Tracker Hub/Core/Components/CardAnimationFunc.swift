//
//  CardAnimationFunc.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 07.03.2025.
//

import Foundation

class CardAnimationFunc {
    func scaleFactor(for frame: CGRect, screenHeight: CGFloat) -> CGFloat {
        let threshold: CGFloat = 150
        
        // Нижняя зона: когда карточка появляется снизу
        if frame.minY >= screenHeight - threshold {
            let effect = min((frame.minY - (screenHeight - threshold)) / threshold, 1.0)
            return 1.0 - effect * 0.2  // уменьшается до 0.8 при максимальном эффекте
        }
        // Верхняя зона: когда карточка уходит сверху
        if frame.minY <= threshold {
            let effect = min((threshold - frame.minY) / threshold, 1.0)
            return 1.0 - effect * 0.2
        }
        return 1.0 // центральная область – без эффекта
    }
    
    // Вычисление прозрачности
    func opacity(for frame: CGRect, screenHeight: CGFloat) -> Double {
        let threshold: CGFloat = 150
        
        if frame.minY >= screenHeight - threshold {
            let effect = min((frame.minY - (screenHeight - threshold)) / threshold, 1.0)
            return 1.0 - Double(effect) * 0.5  // opacity снижается до 0.5
        }
        if frame.minY <= threshold {
            let effect = min((threshold - frame.minY) / threshold, 1.0)
            return 1.0 - Double(effect) * 0.5
        }
        return 1.0
    }
    
    // Вычисление вертикального смещения для эффекта параллакса
    func offset(for frame: CGRect, screenHeight: CGFloat) -> CGFloat {
        let threshold: CGFloat = 150
        
        if frame.minY >= screenHeight - threshold {
            let effect = min((frame.minY - (screenHeight - threshold)) / threshold, 1.0)
            return effect * 30  // смещение вниз до 30 поинтов
        }
        if frame.minY <= threshold {
            let effect = min((threshold - frame.minY) / threshold, 1.0)
            return -effect * 30  // смещение вверх до -30 поинтов
        }
        return 0
    }
}
