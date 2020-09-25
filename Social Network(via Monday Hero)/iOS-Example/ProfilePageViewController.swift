import UIKit

class ProfilePageViewController: UIViewController {
	
	// MARK: - Properties

	@IBOutlet private weak var iconImageView: UIImageView!
	@IBOutlet private weak var menuImageView: UIImageView!
	@IBOutlet private weak var nolanAlexLabel: UILabel!
	@IBOutlet private weak var profilPictureImageView: UIImageView!
	@IBOutlet private weak var followButton: UIButton!
	@IBOutlet private weak var alexanderNolanLabel: UILabel!
	@IBOutlet private weak var photographyLoverFrLabel: UILabel!
	@IBOutlet private weak var photosLabel: UILabel!
	@IBOutlet private weak var likesLabel: UILabel!
	@IBOutlet private weak var marksLabel: UILabel!
	@IBOutlet private weak var userPicturesCollectionView: UICollectionView!
	@IBOutlet private weak var addPhotoButton: UIButton!
	@IBOutlet private weak var baseView2: UIView!
	@IBOutlet private weak var profileIconImageView: UIImageView!
	@IBOutlet private weak var iconImageView2: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}

}

extension ProfilePageViewController {
	private func setupViews() {

		


		nolanAlexLabel.text = NSLocalizedString("nolan.alex", comment: "")
		nolanAlexLabel.textColor = UIColor.black
		nolanAlexLabel.numberOfLines = 0
		nolanAlexLabel.font = UIFont.textStyle5
		nolanAlexLabel.textAlignment = .center



		followButton.layer.cornerRadius = 6
		followButton.layer.masksToBounds =  true 
		followButton.backgroundColor = UIColor.cerulean
		followButton.setTitle(NSLocalizedString("follow2", comment: ""),for: .normal)
		followButton.setTitleColor(UIColor.daisy, for: .normal)
		followButton.titleLabel?.font = UIFont.textStyle11
		followButton.contentHorizontalAlignment = .leading 
		followButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 9 , bottom: 6, right: 9)


		alexanderNolanLabel.text = NSLocalizedString("alexander.nolan", comment: "")
		alexanderNolanLabel.textColor = UIColor.black
		alexanderNolanLabel.numberOfLines = 0
		alexanderNolanLabel.font = UIFont.textStyle10
		alexanderNolanLabel.textAlignment = .center


		photographyLoverFrLabel.text = NSLocalizedString("photography.lover.from.8.years", comment: "")
		photographyLoverFrLabel.textColor = UIColor.silver2
		photographyLoverFrLabel.numberOfLines = 0
		photographyLoverFrLabel.font = UIFont.textStyle3
		photographyLoverFrLabel.textAlignment = .center


		photosLabel.text = NSLocalizedString(".photos", comment: "")
		photosLabel.textColor = UIColor.black
		photosLabel.numberOfLines = 0
		photosLabel.font = UIFont.textStyle2
		photosLabel.textAlignment = .center


		likesLabel.text = NSLocalizedString(".likes3", comment: "")
		likesLabel.textColor = UIColor.cloud
		likesLabel.numberOfLines = 0
		likesLabel.font = UIFont.textStyle2
		likesLabel.textAlignment = .center


		marksLabel.text = NSLocalizedString(".marks", comment: "")
		marksLabel.textColor = UIColor.cloud
		marksLabel.numberOfLines = 0
		marksLabel.font = UIFont.textStyle9
		marksLabel.textAlignment = .center


		userPicturesCollectionView.backgroundColor = UIColor.clear
		self.userPicturesCollectionView.dataSource = self


		addPhotoButton.setImage(UIImage(named: "button") , for: .normal)


		baseView2.backgroundColor = UIColor.daisy





	}

	private func setupLayout() { 
		//Constraints are defined in Storyboard file.
	}

}

// MARK: - Collection View DataSource

extension ProfilePageViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPictureCollectionViewCell", for: indexPath) as! UserPictureCollectionViewCell
		return cell
	}

}


