//
//  GenericFormField.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 10/12/2020.
//

protocol GenericFormField {
    var id: String! { get set }
    var value: String? { get set }
    var placeholder: String? { get set }
    var validations: [GenericFormFieldValidationRule] { get set }
    
    func becomeFirstResponder() -> Bool
    
    init(id: String)
}
