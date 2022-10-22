//
//  ArticleCell.swift
//  NineNewsStories
//
//  Created by Clayton Gilbert on 10/10/22.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet var headlineLabel: UILabel!
    @IBOutlet var abstractLabel: UILabel!
    @IBOutlet var byLineLabel: UILabel!
    @IBOutlet var thumbnail: UIImageView!
    
    var cellViewModel: ArticleCellViewModel? {
        didSet {
            headlineLabel.text = cellViewModel?.headline
            abstractLabel.text = cellViewModel?.abstract
            byLineLabel.text = cellViewModel?.byLine
            if let thumbnailString = cellViewModel?.thumbnail {
                if let url = URL(string: thumbnailString) {
                    thumbnail.loadImageWithUrl(url)
                }
            }
        }
    }

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headlineLabel.text = nil
        abstractLabel.text = nil
        byLineLabel.text = nil
        thumbnail.image = nil
    }

}
