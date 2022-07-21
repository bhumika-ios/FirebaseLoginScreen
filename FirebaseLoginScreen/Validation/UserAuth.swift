//
//  UserAuth.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 23/06/22.
//

import Foundation

class UserAuth: ObservableObject{
    @Published var isLoggin : Bool = false
    
    @Published var isCorrect : Bool = true
}
