//
//  DialogAction.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

struct DialogAction {
    struct Default {
        struct Next {
            static var title: (()->String) = { "Next" }
        }
        struct Positive {
            static var title: (()->String) = { "Yes" }
        }
        struct OK {
            static var title: (()->String) = { "Ok" }
        }
        struct Done {
            static var title: (()->String) = { "Done" }
        }
        struct Negative {
            static var title: (()->String) = { "No" }
        }
        struct Cancel {
            static var title: (()->String) = { "Cancel" }
        }
        struct Close {
            static var title: (()->String) = { "Close" }
        }
    }
    
    enum Kind {
        case positive
        case negative
        case cancel
    }
    var title: String? = nil
    var style: UIAlertAction.Style = .default
    var kind: Kind = .positive
    
    static func next(title: String? = DialogAction.Default.Next.title(), style: UIAlertAction.Style = .default) -> DialogAction {
        return DialogAction(title: title, style: style, kind: .positive)
    }
    static func ok(title: String? = DialogAction.Default.OK.title(), style: UIAlertAction.Style = .default) -> DialogAction {
        return DialogAction(title: title, style: style, kind: .positive)
    }
    static func done(title: String? = DialogAction.Default.Done.title(), style: UIAlertAction.Style = .default) -> DialogAction {
        return DialogAction(title: title, style: style, kind: .positive)
    }
    static func positive(title: String? = DialogAction.Default.Positive.title(), style: UIAlertAction.Style = .default) -> DialogAction {
        return DialogAction(title: title, style: style, kind: .positive)
    }
    static func negative(title: String? = DialogAction.Default.Negative.title(), style: UIAlertAction.Style = .default) -> DialogAction {
        return DialogAction(title: title, style: style, kind: .negative)
    }
    static func cancel(title: String? = DialogAction.Default.Cancel.title(), style: UIAlertAction.Style = .default) -> DialogAction {
        return DialogAction(title: title, style: style, kind: .negative)
    }
    static func close(title: String? = DialogAction.Default.Close.title(), style: UIAlertAction.Style = .default) -> DialogAction {
        return DialogAction(title: title, style: style, kind: .negative)
    }
    init(title: String? = nil, style: UIAlertAction.Style = .default, kind: Kind = .positive) {
        self.title = title
        self.style = style
        self.kind = kind
    }
}


