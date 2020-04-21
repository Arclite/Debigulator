//  Created by Geoff Pado on 3/29/20.
//  Copyright © 2020 Cocoatype. All rights reserved.

import PhotoData
import UIKit

class SceneViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        embed(NavigationController())
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
}
