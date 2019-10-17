//
//  View.swift
//  previewUI
//
//  Created by Nghia on 14/10/19.
//  Copyright © 2019 Nghia. All rights reserved.
//

import UIKit
import SwiftUI

class TestView: UIView {
    struct Model {
        let color: UIColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.blue
        
        let text = UILabel()
        text.text = "Ky"
        
        addSubview(text)
        text.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        text.backgroundColor = .brown
    }
}

extension TestView: ViewConfigurable {
    func configure(viewModel: TestView.Model) {
        backgroundColor = viewModel.color
    }
}

struct PreviewModel<T> {
    let name: String
    let model: T
}

#if canImport(SwiftUI) && DEBUG
@available(iOS 13.0, *)
struct TestView_Preview: PreviewProvider {
    
    static var previews: some View {
        let models = [
            PreviewModel(name: "green", model: TestView.Model(color: UIColor.green)),
            PreviewModel(name: "red", model: TestView.Model(color: UIColor.red))]
        
        return ForEach(models, id: \.name) { color in
            TestView()
                .grab(viewModel: color.model)
                .swiftUI
                .frame(height: 120)
                .previewLayout(.sizeThatFits)
                .previewsToAllSizes(prefix: color.name)
        }
    }
}
#endif
