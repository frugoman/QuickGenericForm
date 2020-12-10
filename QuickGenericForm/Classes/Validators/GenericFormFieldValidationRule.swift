//
//  GenericFormFieldValidation.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 10/12/2020.
//

public protocol GenericFormFieldValidationRule {
    func check(field: GenericFormField) -> Bool
}

public struct RequiredFieldValidation: GenericFormFieldValidationRule {
    public init() {}
    
    public func check(field: GenericFormField) -> Bool {
        guard let value = field.value, !value.isEmpty else { return false }
        return true
    }
}

public struct MinLengthFieldValidation: GenericFormFieldValidationRule {
    private let minLength: Int
    
    public init(_ length: Int) {
        minLength = length
    }
    
    public func check(field: GenericFormField) -> Bool {
        guard let value = field.value, value.count >= minLength else { return false }
        return true
    }
}

public struct MaxLengthFieldValidation: GenericFormFieldValidationRule {
    private let maxLength: Int
    
    public init(_ length: Int) {
        maxLength = length
    }
    
    public func check(field: GenericFormField) -> Bool {
        guard let value = field.value, value.count >= maxLength else { return false }
        return true
    }
}
