//
//  ProjectTableViewCell.swift
//  Task
//
//  Created by Caleb Hicks on 10/18/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

@IBDesignable

class ButtonTableViewCell: UITableViewCell {

    @IBAction func buttonTapped(_ sender: Any) {
		delegate?.buttonCellButtonTapped(self)
    }
	
	// MARK: Private
	
    fileprivate func updateButton(_ isComplete: Bool) {
		let imageName = isComplete ? "complete" : "incomplete"
		completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
	
	// MARK: Properties
	
	var delegate: ButtonTableViewCellDelegate?
	
	@IBOutlet weak var completeButton: UIButton!
	@IBOutlet weak var primaryLabel: UILabel!
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

