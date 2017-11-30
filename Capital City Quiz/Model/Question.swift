//
//  Question.swift
//  Capital City Quiz
//
//  Created by Jae Guk Lee on 11/26/17.
//  Copyright © 2017 Jae Guk Lee. All rights reserved.
//

import Foundation

class Question {
    
    let country : String
    let capitalCity : String
    
    init(countryText : String, correctAnswer: String){
        country = countryText
        capitalCity = correctAnswer
    }
    
    
}
