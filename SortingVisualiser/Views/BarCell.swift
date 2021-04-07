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

    var barHeight: Int = 0 {
        didSet {
            barViewHeightLC.constant = CGFloat(barHeight)
        }
    }

    var color: UIColor = .red {
        didSet {
            barView.backgroundColor = color
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
