import UIKit

class NewPostTableViewCell: UITableViewCell {
	
	// MARK: - Properties

	@IBOutlet private weak var rectangleView: UIView!
	@IBOutlet private weak var oval5ImageView: UIImageView!
	@IBOutlet private weak var jennieDeanLabel: UILabel!
	@IBOutlet private weak var icDownImageView: UIImageView!
	@IBOutlet private weak var minAgoLabel: UILabel!
	@IBOutlet private weak var photoOutImageView: UIImageView!
	@IBOutlet private weak var actionsImageView: UIImageView!
	@IBOutlet private weak var destinationiconImageView: UIImageView!
	@IBOutlet private weak var heartLikedImageView: UIImageView!
	@IBOutlet private weak var separatorImageView: UIImageView!
	@IBOutlet private weak var jennieDeanLabel2: UILabel!
	@IBOutlet private weak var likesLabel: UILabel!
	@IBOutlet private weak var likeiconImageView: UIImageView!
	@IBOutlet private weak var oneOfTheBestWaysLabel: UILabel!
	@IBOutlet private weak var see14CommentsLabel: UILabel!
	@IBOutlet private weak var iconImageView: UIImageView!


	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.setupViews()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupViews() {
		
		rectangleView.backgroundColor = UIColor.daisy


		jennieDeanLabel.text = NSLocalizedString("jennie.dean", comment: "")
		jennieDeanLabel.textColor = UIColor.spruce
		jennieDeanLabel.numberOfLines = 0
		jennieDeanLabel.font = UIFont.textStyle2
		jennieDeanLabel.textAlignment = .left



		minAgoLabel.text = NSLocalizedString("min.ago", comment: "")
		minAgoLabel.textColor = UIColor.silver
		minAgoLabel.numberOfLines = 0
		minAgoLabel.font = UIFont.textStyle
		minAgoLabel.textAlignment = .left







		jennieDeanLabel2.text = NSLocalizedString("jennie.dean", comment: "")
		jennieDeanLabel2.textColor = UIColor.anchor2
		jennieDeanLabel2.numberOfLines = 0
		jennieDeanLabel2.font = UIFont.textStyle2
		jennieDeanLabel2.textAlignment = .left


		likesLabel.text = NSLocalizedString(".likes", comment: "")
		likesLabel.textColor = UIColor.spruce
		likesLabel.numberOfLines = 0
		likesLabel.font = UIFont.textStyle3
		likesLabel.textAlignment = .right



		oneOfTheBestWaysLabel.text = NSLocalizedString("one.of.the.best.ways.to.make.a.great.vacation.quic", comment: "")
		oneOfTheBestWaysLabel.textColor = UIColor.pewter
		oneOfTheBestWaysLabel.numberOfLines = 0
		oneOfTheBestWaysLabel.font = UIFont.textStyle3
		oneOfTheBestWaysLabel.textAlignment = .left


		see14CommentsLabel.text = NSLocalizedString("see.14.comments", comment: "")
		see14CommentsLabel.textColor = UIColor.cloud2
		see14CommentsLabel.numberOfLines = 0
		see14CommentsLabel.font = UIFont.textStyle3
		see14CommentsLabel.textAlignment = .left





	}

}
