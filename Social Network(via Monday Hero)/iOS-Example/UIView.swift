import UIKit

extension UIView {

	func disableSubviewsForUserInteraction() {
		for subView in self.subviews {
			subView.isUserInteractionEnabled = false
		}
	}

}

extension UITextField {
       
	func setLeftView(with image: UIImage? = nil, imageFrame: CGRect? = nil, leftViewFrame: CGRect) {
		let containerView = UIView(frame: leftViewFrame)
        
		if let leftImage = image, let leftImageFrame = imageFrame {
			let imageView = UIImageView(image: leftImage)
			imageView.frame = leftImageFrame
			imageView.contentMode = .center
			containerView.addSubview(imageView)
		}
        
		leftView = containerView
		leftViewMode = .always
	}

}
