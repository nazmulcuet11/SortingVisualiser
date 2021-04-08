//
//  BarCell.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import UIKit

class BarCell: UICollectionViewCell {

    static let reuseId = "BarCell"

    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var barViewHeightLC: NSLayoutConstraint!
    @IBOutlet weak var barViewBottomAnchorLC: NSLayoutConstraint!
    @IBOutlet weak var barViewLeadingAnchorLC: NSLayoutConstraint!
    @IBOutlet weak var barViewTrailingAnchorLC: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with dataPoint: DataPoint) {
        barViewHeightLC.constant = CGFloat(dataPoint.height)
        barView.backgroundColor = dataPoint.color
    }
}
