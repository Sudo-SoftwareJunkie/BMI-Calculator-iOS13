//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Kyle Jordan on 2/23/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = String(format: "%.1f", (weight / (height * height)))
        let bmiCategory = getBmiCategory(bmiValue: bmiValue)
        
        switch bmiCategory {
            case "Underweight", "Obese":
                bmi = BMI(value: bmiValue, advice: "Please consult a healthcare professional.", color: .red)
            case "Normal":
                bmi = BMI(value: bmiValue, advice: "Maintain a healthy lifestyle.", color: .green)
            default:
                bmi = BMI(value: bmiValue, advice: "Try exercising more and eating healthier.", color: .yellow)
        }
    }
    
    func getBMIResult() -> String {
        return self.bmi?.value ?? "0.0"
    }
    
    func getBmiCategory(bmiValue: String) -> String {
        let bmiFloatValue = Float(bmiValue)!
        
        if bmiFloatValue < 18.5 {
            return "Underweight"
        } else if bmiFloatValue < 25 {
            return "Normal"
        } else if bmiFloatValue < 30 {
            return "Overweight"
        } else {
            return "Obese"
        }
    }
}
