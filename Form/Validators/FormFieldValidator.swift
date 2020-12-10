//
//  FormFieldValidator.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 10/12/2020.
//

protocol FormFieldValidator {
    func isFormFieldValid(_ field: GenericFormField,forGenericForm form: GenericForm) -> Bool
    
}

class DefaultFormFieldValidator: FormFieldValidator {
    func isFormFieldValid(_ field: GenericFormField, forGenericForm form: GenericForm) -> Bool {
        field.validations.allSatisfy { $0.check(field: field) }
    }
}
