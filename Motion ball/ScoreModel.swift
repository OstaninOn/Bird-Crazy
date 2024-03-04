//
//  ScoreModel.swift
//  Motion ball
//
//  Created by  aleksandr on 1.03.24.
//

import Foundation

struct ScoreModel : Codable {
    var name : String
    var score: Int
    var date: String
}

extension ScoreModel: Comparable {
    static func < (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        lhs.score < rhs.score
    }
    
    
}

