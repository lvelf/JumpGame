//
//  ScoreHelper.swift
//  JumpGame
//
//  Created by 诺诺诺诺诺 on 2022/10/2.
//

import UIKit

class ScoreHelper: NSObject {
    
    private let kHeightScoreKey = "highest_score"
    
    private override init() {
        
    }
    
    static let shared: ScoreHelper = ScoreHelper()
    
    func getHighestScore() -> Int {
        return UserDefaults.standard.integer(forKey: kHeightScoreKey)
    }
    
    func setHighestScore(_ score: Int) {
        if score > getHighestScore() {
            UserDefaults.standard.set(score, forKey: kHeightScoreKey)
            UserDefaults.standard.synchronize()
        }
        RankingListViewController.shared.rankingList.append(HeaderItem(score: score))
        RankingListViewController.shared.rankingList.sort()
        RankingListViewController.shared.reloadData()
        print("new score")
    }
}
