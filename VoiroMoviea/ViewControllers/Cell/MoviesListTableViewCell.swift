//
//  MoviesListTableViewCell.swift
//  VoiroMoviea
//
//  Created by SNOW on 04/06/22.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var posterImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
