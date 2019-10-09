//
//  UserStorage.swift
//  WorkoutTracker
//
//  Created by Goran Brlas on 03/09/2019.
//  Copyright © 2019 Goran Brlas. All rights reserved.
//

import Foundation

class UserStorage {
    static var instance = UserStorage()
    
    private init() {}
}

fileprivate extension UserStorage {
    
    enum UserStorageKeys: String, CaseIterable {
        case workoutHistory
    }
    
}

extension UserStorage {

    var workoutModels: [WorkoutHistoryModel] {
        get { return UserDefaults.standard.object(ofType: [WorkoutHistoryModel].self, forKey: .workoutHistory) ?? [] }
        set(newValue) { UserDefaults.standard.set(object: newValue, forKey: .workoutHistory) }
    }
    
}

fileprivate extension UserDefaults {
    
    func object<T: Decodable>(ofType type: T.Type, forKey key: UserStorage.UserStorageKeys, decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = data(forKey: key.rawValue) else { return nil }
        guard let model = try? decoder.decode(T.self, from: data) else { return nil }
        return model
    }
    
    func set<T: Encodable>(object: T, forKey key: UserStorage.UserStorageKeys, encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        set(data, forKey: key.rawValue)
    }
    
}
