//
//  FormValidator.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 10/12/2020.
//

public protocol FormValidator {
    func isFormFieldValid(_ fields: [GenericFormField], forGenericForm form: GenericForm) -> Bool
}

public class DefaultFormValidator: FormValidator {
    public init() {}
    
    public func isFormFieldValid(_ fields: [GenericFormField], forGenericForm form: GenericForm) -> Bool {
        fields.allSatisfy { field in
            field.validations.allSatisfy { validation in
                validation.check(field: field)
            }
        }
    }
}
