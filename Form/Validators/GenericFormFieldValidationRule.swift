//
//  GenericFormFieldValidation.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 10/12/2020.
//

protocol GenericFormFieldValidationRule {
    func check(field: GenericFormField) -> Bool
}

struct RequiredFieldValidation: GenericFormFieldValidationRule {
    func check(field: GenericFormField) -> Bool {
        guard let value = field.value, !value.isEmpty else { return false }
        return true
    }
}

struct MinLengthFieldValidation: GenericFormFieldValidationRule {
    private let minLength: Int
    
    init(_ length: Int) {
        minLength = length
    }
    
    func check(field: GenericFormField) -> Bool {
        guard let value = field.value, value.count >= minLength else { return false }
        return true
    }
}

struct MaxLengthFieldValidation: GenericFormFieldValidationRule {
    private let maxLength: Int
    
    init(_ length: Int) {
        maxLength = length
    }
    
    func check(field: GenericFormField) -> Bool {
        guard let value = field.value, value.count >= maxLength else { return false }
        return true
    }
}
