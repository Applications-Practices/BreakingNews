//
//  HomeViewCell.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private var viewModel = HomeTableViewCellViewModel()
    
    var headline: HeadlineEntity? {
        didSet {
            self.setInformation()
        }
    }
    
    override func awakeFromNib() {
        self.setup()
    }
    
    func setup() {
        self.setDefaultElements()
    }
    
    func setDefaultElements() {
        self.setBackgroundColor()
        self.setupOverlayView()
        self.setupTitleLabelView()
        self.setupDescriptionTextView()
    }
    
    func setInformation() {
        self.setTitle()
        self.setDescription()
        self.setImageView()
    }
    
    func setBackgroundColor() {
        self.contentView.backgroundColor = self.viewModel.getBackgroundColor()
        
        self.mainView.backgroundColor = self.viewModel.getMainBackgroundColor()
        self.mainView.layer.borderWidth = self.viewModel.getBorderWidth()
        self.mainView.layer.borderColor = self.viewModel.getBorderColor().cgColor
    }
    
    func setupOverlayView() {
        self.overlayView.backgroundColor = self.viewModel.getOverlayBackground()
    }
    
    func setupTitleLabelView() {
        self.titleLabel.textColor = self.viewModel.getTitleTextColor()
        self.titleLabel.font = self.titleLabel.font.withSize(self.viewModel.getTitleTextSize())
    }
    
    func setupDescriptionTextView() {
        self.descriptionTextView.backgroundColor = self.viewModel.getDescriptionBackground()
        self.descriptionTextView.textColor = self.viewModel.getDescriptionTextColor()
        self.descriptionTextView.font = self.descriptionTextView.font?.withSize(self.viewModel.getDescriptionTextSize())
        self.descriptionTextView.textContainer.maximumNumberOfLines = self.viewModel.getMaxLinesDescription()
        self.descriptionTextView.textContainer.lineBreakMode = .byTruncatingTail
    }
    
    func setTitle() {
        self.titleLabel.text = self.headline?.title
    }
    
    func setDescription() {
        self.descriptionTextView.text = self.headline?.description
    }
    
    func setImageView() {
        let url = R.URLs.createURL(string: self.headline?.urlToImage ?? "")
        if url == nil {
            self.mainImageView.contentMode = .scaleAspectFit
        }
        else {
            self.mainImageView.contentMode = .scaleAspectFill
        }
        R.Images.loadImage(imageView: self.mainImageView, url: url, placeHolder: R.Images.logo, completion: nil)
    }
    
}
