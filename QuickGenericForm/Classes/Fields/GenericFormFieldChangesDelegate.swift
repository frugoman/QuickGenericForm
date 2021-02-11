//
//  GenericFormFieldChangesDelegate.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 11/02/2021.
//

public protocol GenericFormFieldChangesDelegate {
    func genericField(
        field: GenericFormField,
        didChangeValue newValue: String
    )
}
