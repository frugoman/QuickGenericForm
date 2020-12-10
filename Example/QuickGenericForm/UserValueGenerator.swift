//
//  UserValueGenerator.swift
//  QuickGenericForm_Example
//
//  Created by Nicolas Frugoni on 10/12/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import QuickGenericForm

class UserValueGenerator: FormValueGenerator {
    typealias FormValue = User
    
    func buildDataFrom(form: GenericForm) -> Result<User, FormValueGeneratorError> {
        guard let firstname = form.fields.first(where: { $0.id == "firstname" })?.value
        else { return .failure(.missingField("firstname")) }
        guard let lastname = form.fields.first(where: { $0.id == "lastname" })?.value
        else { return .failure(.missingField("lastname")) }
        guard let email = form.fields.first(where: { $0.id == "email" })?.value
        else { return .failure(.missingField("email")) }
        
        let phone = form.fields.first(where: { $0.id == "phone" })?.value
        
        return .success(
            User(
                name: firstname,
                lastName: lastname,
                phone: phone,
                email: email
            )
        )
    }
}
