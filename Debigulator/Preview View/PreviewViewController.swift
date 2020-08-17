//  Created by Geoff Pado on 4/22/20.
//  Copyright © 2020 Cocoatype. All rights reserved.

import UIKit

class PreviewViewController: UIViewController {
    init(imageData: Data, originalData: Data) {
        lowQualityImage = UIImage(data: imageData)
        highQualityImage = UIImage(data: originalData)
        compression = Double(imageData.count) / Double(originalData.count)
        super.init(nibName: nil, bundle: nil)

        edgesForExtendedLayout = .top
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
    }

    override func loadView() {
        previewView.image = lowQualityImage
        view = previewView
    }

    @objc private func shareImage() {
        guard let image = lowQualityImage else { return }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }

    // MARK: Actions

    @objc func toggleFocus() {
        let duration = TimeInterval(UINavigationController.hideShowBarDuration)
        UIView.animate(withDuration: duration) { [unowned self] in
            self.isFocusing.toggle()
        }
    }

    private var isFocusing = false {
        didSet {
            previewView.isFocusing = isFocusing
            navigationController?.setNavigationBarHidden(isFocusing, animated: true)
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    @objc func showLowQuality() {
        previewView.image = lowQualityImage
    }

    @objc func showHighQuality() {
        previewView.image = highQualityImage
    }

    // MARK: Status Bar

    override var prefersStatusBarHidden: Bool { isFocusing }

    // MARK: Boilerplate

    private let compression: Double
    private let lowQualityImage: UIImage?
    private let highQualityImage: UIImage?
    private let previewView = PreviewView()

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
}
