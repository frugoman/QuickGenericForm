//
//  FormValueGenerator.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 10/12/2020.
//

public protocol FormValueGenerator {
    associatedtype FormValue
    
    func buildDataFrom(form: GenericForm) -> Result<FormValue, FormValueGeneratorError>
}
