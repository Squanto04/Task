//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Jordan Lamb on 9/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit


protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped (_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    var delegate: ButtonTableViewCellDelegate?
    
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    fileprivate func updateButton(_ isComeplete: Bool) {
        let imageName = isComeplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}
