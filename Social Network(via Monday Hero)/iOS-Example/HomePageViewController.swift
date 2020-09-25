import UIKit

class HomePageViewController: UIViewController {
	
	// MARK: - Properties

	@IBOutlet private weak var iconImageView: UIImageView!
	@IBOutlet private weak var menuImageView: UIImageView!
	@IBOutlet private weak var nolanAlexLabel: UILabel!
	@IBOutlet private weak var pic03ImageView: UIImageView!
	@IBOutlet private weak var alexanderNolanLabel: UILabel!
	@IBOutlet private weak var heartLikedImageView: UIImageView!
	@IBOutlet private weak var likes228989Label: UILabel!
	@IBOutlet private weak var thePearlInTheOceLabel: UILabel!
	@IBOutlet private weak var addPictureButton: UIButton!
	@IBOutlet private weak var baseView: UIView!
	@IBOutlet private weak var profileIconImageView: UIImageView!
	@IBOutlet private weak var iconImageView2: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}

}

extension HomePageViewController {
	private func setupViews() {

		


		nolanAlexLabel.text = NSLocalizedString("nolan.alex", comment: "")
		nolanAlexLabel.textColor = UIColor.black
		nolanAlexLabel.numberOfLines = 0
		nolanAlexLabel.font = UIFont.textStyle5
		nolanAlexLabel.textAlignment = .center



		alexanderNolanLabel.text = NSLocalizedString("alexander.nolan", comment: "")
		alexanderNolanLabel.textColor = UIColor.black
		alexanderNolanLabel.numberOfLines = 0
		alexanderNolanLabel.font = UIFont.textStyle5
		alexanderNolanLabel.textAlignment = .left



		likes228989Label.text = NSLocalizedString(".likes..2289890.views..13089.downloads", comment: "")
		likes228989Label.textColor = UIColor.coin3
		likes228989Label.numberOfLines = 0
		likes228989Label.font = UIFont.textStyle6
		likes228989Label.textAlignment = .left


		thePearlInTheOceLabel.text = NSLocalizedString("the.pearl.in.the.ocean.the.ocean.always.makes.me.f", comment: "")
		thePearlInTheOceLabel.textColor = UIColor.black
		thePearlInTheOceLabel.numberOfLines = 0
		thePearlInTheOceLabel.font = UIFont.textStyle7
		thePearlInTheOceLabel.textAlignment = .left


		addPictureButton.setImage(UIImage(named: "add3") , for: .normal)


		baseView.layer.borderColor = UIColor.salt3.cgColor
		baseView.layer.borderWidth =  1
		baseView.backgroundColor = UIColor.daisy





	}

	private func setupLayout() { 
		//Constraints are defined in Storyboard file.
	}

}

