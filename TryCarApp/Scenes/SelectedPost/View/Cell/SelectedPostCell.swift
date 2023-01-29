//
//  SelectedPostCell.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

class SelectedPostCell: UITableViewCell, SelectedPostCellView {
    
    //...IBOutlets...
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var emailLb: UILabel!
    @IBOutlet weak var detailsLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    func displayName(nameText: String) {
        nameLb.text = nameText
    }
    func displayEmail(emailText: String) {
        emailLb.text = emailText
    }
    func displayDetails(detailsText: String) {
        detailsLb.text = detailsText
    }
}
