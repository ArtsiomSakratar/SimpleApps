import UIKit

class ListPageViewController: UIViewController {
	
	// MARK: - Properties

	@IBOutlet private weak var popularLabel: UILabel!
	@IBOutlet private weak var newLabel: UILabel!
	@IBOutlet private weak var followLabel: UILabel!
	@IBOutlet private weak var exploreListTableView: UITableView!
	@IBOutlet private weak var addPictureButton: UIButton!
	@IBOutlet private weak var baseView: UIView!
	@IBOutlet private weak var profileIconImageView: UIImageView!
	@IBOutlet private weak var iconImageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}

}

extension ListPageViewController {
	private func setupViews() {

		
		popularLabel.text = NSLocalizedString("popular", comment: "")
		popularLabel.textColor = UIColor.black
		popularLabel.numberOfLines = 0
		popularLabel.font = UIFont.textStyle5
		popularLabel.textAlignment = .left


		newLabel.text = NSLocalizedString("new", comment: "")
		newLabel.textColor = UIColor.slate
		newLabel.numberOfLines = 0
		newLabel.font = UIFont.textStyle5
		newLabel.textAlignment = .left


		followLabel.text = NSLocalizedString("follow", comment: "")
		followLabel.textColor = UIColor.coin2
		followLabel.numberOfLines = 0
		followLabel.font = UIFont.textStyle5
		followLabel.textAlignment = .left


		self.exploreListTableView.rowHeight = UITableView.automaticDimension
		self.exploreListTableView.estimatedRowHeight = 30
		self.exploreListTableView.dataSource = self


		addPictureButton.setImage(UIImage(named: "add2") , for: .normal)


		baseView.layer.borderColor = UIColor.salt2.cgColor
		baseView.layer.borderWidth =  1
		baseView.backgroundColor = UIColor.daisy





	}

	private func setupLayout() { 
		//Constraints are defined in Storyboard file.
	}

}

// MARK: - Table View DataSource

extension ListPageViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
		let cell = tableView.dequeueReusableCell(withIdentifier: "ExplorePhotoTableViewCell") as! ExplorePhotoTableViewCell
		return cell
	}

}



