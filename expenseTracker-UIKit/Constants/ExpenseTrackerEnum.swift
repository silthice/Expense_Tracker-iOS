//
//  ExpenseTrackerEnum.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import Foundation
import UIKit

protocol Category {
    var getCategoryName: String { get }
    var getCategoryRawValue: Int { get }
    var getCategoryImage: UIImage { get }
}

extension ExpenseTracker.Enum {
    enum EnumTextFieldPurposeType {
        case username
        case email
        case password
        case password2
    }
    
    enum EnumCurrencyCode: String, Encodable, Decodable {
        case sgd = "SGD"
        case myr = "MYR"
        case usd = "USD"
        
        var getCurrency: String {
            switch self {
            case .myr: return "RM"
            case .usd, .sgd: return "$"
            }
        }
    }
    
    enum EnumSpendingCategory: Int, Encodable, Decodable, CaseIterable, Category {
        case foodAndDrinks = 1      // Food & Drinks
        case shopping = 2      // shopping
        case transport = 3      // transport
        case billAndFees = 4      // billAndFees
        case entertainment = 5 // entertainment
        case car = 6      // car
        case travel = 7      // travel
        case home = 8      // home
        case healthCare = 9      // healthCare
        case education = 10      // education
        case groceries = 11     // groceries
        case beauty = 12     // beauty
        case sports = 13     // sports
        case work = 14     // work
        case family = 15     // family
        case gift = 16     // gift
        case others = 17     // others
        
        var getCategoryName: String {
            switch self {
            case .foodAndDrinks: return "Food & Drinks" // Default
            case .shopping: return "Shopping" // Default
            case .transport: return "Transport" // Default
            case .billAndFees: return "Bill & Fees" // Default
            case .entertainment: return "Entertainment" // Default
            case .car: return "Car" // Default
            case .travel: return "Travel" // Default
            case .home: return "Home" // Default
            case .healthCare: return "Healthcare" // Default
            case .education: return "Education" // Default
            case .groceries: return "Groceries" // Default
            case .beauty: return "Beauty" // Default
            case .sports: return "Sports" // Default
            case .work: return "Work" // Default
            case .family: return "Family" // Default
            case .gift: return "Gift" // Default
            case .others: return "Others" // Default
            }
        }
        
        var getCategoryRawValue: Int {
            switch self {
            case .foodAndDrinks: return 1
            case .shopping: return 2
            case .transport: return 3
            case .billAndFees: return 4
            case .entertainment: return 5
            case .car: return 6
            case .travel: return 7
            case .home: return 8
            case .healthCare: return 9
            case .education: return 10
            case .groceries: return 11
            case .beauty: return 12
            case .sports: return 13
            case .work: return 14
            case .family: return 15
            case .gift: return 16
            case .others: return 17
            }
        }
        
        var getCategoryImage: UIImage {
            switch self {
            case .foodAndDrinks: return UIImage(systemName: "fork.knife")!
            case .shopping: return UIImage(systemName: "handbag.fill")!
            case .transport: return UIImage(systemName: "bus")!
            case .billAndFees: return UIImage(systemName: "banknote.fill")!
            case .entertainment: return UIImage(systemName: "theatermasks.fill")!
            case .car: return UIImage(systemName: "car.fill")!
            case .travel: return UIImage(systemName: "airplane.departure")!
            case .home: return UIImage(systemName: "house.fill")!
            case .healthCare: return UIImage(systemName: "cross.case.fill")!
            case .education: return UIImage(systemName: "graduationcap.fill")!
            case .groceries: return UIImage(systemName: "carrot.fill")!
            case .beauty: return UIImage(systemName: "camera.macro")!
            case .sports: return UIImage(systemName: "basketball.fill")!
            case .work: return UIImage(systemName: "briefcase.fill")!
            case .family: return UIImage(systemName: "person.2.fill")!
            case .gift: return UIImage(systemName: "gift.fill")!
            case .others: return UIImage(systemName: "questionmark.folder.fill")!
            }
        }
    }
    
    enum EnumIncomeCategory: Int, Encodable, Decodable, CaseIterable, Category {
        case salary = 1      // Food & Drinks
        case business = 2      // shopping
        case extraIncome = 3      // transport
        case gift = 4      // billAndFees
        case others = 5      // car
        
        var getCategoryName: String {
            switch self {
            case .salary: return "Salary" // Default
            case .business: return "Business" // Default
            case .extraIncome: return "Extra Income" // Default
            case .gift: return "Gift" // Default
            case .others: return "Others" // Default]
            }
        }
        
        var getCategoryImage: UIImage {
            switch self {
            case .salary: return UIImage(systemName: "dollarsign")!
            case .business: return UIImage(systemName: "suitcase.fill")!
            case .extraIncome: return UIImage(systemName: "dollarsign.circle.fill")!
            case .gift: return UIImage(systemName: "gift.fill")!
            case .others: return UIImage(systemName: "questionmark.folder.fill")!
            }
        }
        
        var getCategoryRawValue: Int {
            switch self {
            case .salary: return 1
            case .business: return 2
            case .extraIncome: return 3
            case .gift: return 4
            case .others: return 5
            }
        }
    }
    
    
}
