//
//  PostsCell.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

class PostsCell: UITableViewCell, PostsCellView {
    
    //...IBOutlets...
    @IBOutlet weak var titleLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    func displayTitle(titleText: String) {
        titleLb.text = titleText
    }
}
