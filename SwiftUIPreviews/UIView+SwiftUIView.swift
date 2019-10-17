//
//  Copyright © 2019 Nghia. All rights reserved.
//

import UIKit

public protocol SwiftUIAdaptable {}

extension SwiftUIAdaptable where Self: UIView {
    @available(iOS 13.0, *)
    public var swiftUI: SwiftUIView<Self> {
        SwiftUIView(view: self)
    }
    
    public func configure(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension SwiftUIAdaptable where Self: ViewConfigurable {
    func grab(viewModel: Model) -> Self {
        configure(viewModel: viewModel)
        return self
    }
}

extension UIView: SwiftUIAdaptable {}
