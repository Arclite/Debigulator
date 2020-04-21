//  Created by Geoff Pado on 4/20/20.
//  Copyright © 2020 Cocoatype. All rights reserved.

import UIKit

class NavigationBarAppearance: UINavigationBarAppearance {
    init() {
        super.init(idiom: UIDevice.current.userInterfaceIdiom)
        setup()
    }

    override init(barAppearance: UIBarAppearance) {
        super.init(barAppearance: barAppearance)
        setup()
    }

    private func setup() {
        configureWithOpaqueBackground()
        backgroundColor = .systemGreen
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        let typeName = NSStringFromClass(type(of: self))
        fatalError("\(typeName) does not implement init(coder:)")
    }
}
