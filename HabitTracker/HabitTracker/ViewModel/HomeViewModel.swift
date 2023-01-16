//
//  HomeViewModel.swift
//  HabitTracker
//
//  Created by Jakub Szczepanek on 16/01/2023.
//

import Foundation
import SwiftUI
import Qualtrics

class HomeViewModel: ObservableObject {
    public func triggerQualtricsPopup(viewController: UIViewController?) {
        guard let vc = viewController else {
            return
        }
        
        Qualtrics.shared.evaluateProject { (targetingResults) in
            for (_, result) in targetingResults {
                if result.passed() {
                    _ = Qualtrics.shared.display(viewController: vc)
                }
            }
        }
    }
}
