import UIKit

class NewPostPageViewController: UIViewController {
	
	// MARK: - Properties

	@IBOutlet private weak var iconImageView3: UIImageView!
	@IBOutlet private weak var newPostsLabel: UILabel!
	@IBOutlet private weak var newPostsTableView: UITableView!
	@IBOutlet private weak var addPostsButton: UIButton!
	@IBOutlet private weak var baseView: UIView!
	@IBOutlet private weak var profileIconImageView: UIImageView!
	@IBOutlet private weak var iconImageView2: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}

}

extension NewPostPageViewController {
	private func setupViews() {

		

		newPostsLabel.text = NSLocalizedString("new.posts", comment: "")
		newPostsLabel.textColor = UIColor.spruce
		newPostsLabel.numberOfLines = 0
		newPostsLabel.font = UIFont.textStyle4
		newPostsLabel.textAlignment = .center


		self.newPostsTableView.rowHeight = UITableView.automaticDimension
		self.newPostsTableView.estimatedRowHeight = 30
		self.newPostsTableView.dataSource = self


		addPostsButton.setImage(UIImage(named: "add") , for: .normal)


		baseView.layer.borderColor = UIColor.salt.cgColor
		baseView.layer.borderWidth =  1
		baseView.backgroundColor = UIColor.daisy





	}

	private func setupLayout() { 
		//Constraints are defined in Storyboard file.
	}

}

// MARK: - Table View DataSource

extension NewPostPageViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
		let cell = tableView.dequeueReusableCell(withIdentifier: "NewPostTableViewCell") as! NewPostTableViewCell
		return cell
	}

}



