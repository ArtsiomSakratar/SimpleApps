import UIKit

class ExplorePhotoTableViewCell: UITableViewCell {
	
	// MARK: - Properties

	@IBOutlet private weak var photoImageView2: UIImageView!
	@IBOutlet private weak var rosieDelLabel: UILabel!
	@IBOutlet private weak var likesLabel: UILabel!
	@IBOutlet private weak var heartLikedImageView: UIImageView!


	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.setupViews()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupViews() {
		

		rosieDelLabel.text = NSLocalizedString("rosie.del", comment: "")
		rosieDelLabel.textColor = UIColor.porpoise
		rosieDelLabel.numberOfLines = 0
		rosieDelLabel.font = UIFont.textStyle2
		rosieDelLabel.textAlignment = .left


		likesLabel.text = NSLocalizedString(".likes2", comment: "")
		likesLabel.textColor = UIColor.anchor
		likesLabel.numberOfLines = 0
		likesLabel.font = UIFont.textStyle6
		likesLabel.textAlignment = .right





	}

}
