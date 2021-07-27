//
//  FPFeedStatusView.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit
import Masonry

class FPFeedStatusView: UIStackView {
    
    var dist: Float?
    var pace: Float?
    var time: Float?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillProportionally
        self.spacing = 16
        
        let vStackDist = UIStackView()
        vStackDist.axis = .vertical
        vStackDist.alignment = .leading
        vStackDist.distribution = .fillEqually
        vStackDist.spacing = 1
        
        let distLabel = UILabel()
        distLabel.text = "Distance"
        distLabel.textColor = DefaultTabColor
        distLabel.font = FontExtraTiny
        
        let distInKM = UILabel()
        distInKM.text = "14.82 km"
        distInKM.textColor = DefaultBlack
        distInKM.font = FontMain
        
        vStackDist.addArrangedSubview(distLabel)
        vStackDist.addArrangedSubview(distInKM)
        
        let vStackPace = UIStackView()
        vStackPace.axis = .vertical
        vStackPace.alignment = .leading
        vStackPace.distribution = .fillEqually
        vStackPace.spacing = 1
        
        let paceLabel = UILabel()
        paceLabel.text = "Pace"
        paceLabel.textColor = DefaultTabColor
        paceLabel.font = FontExtraTiny
        
        let paceInKM = UILabel()
        paceInKM.text = "3:54 /km"
        paceInKM.textColor = DefaultBlack
        paceInKM.font = FontMain
        
        vStackPace.addArrangedSubview(paceLabel)
        vStackPace.addArrangedSubview(paceInKM)
        
        let vStackTime = UIStackView()
        vStackTime.axis = .vertical
        vStackTime.alignment = .leading
        vStackTime.distribution = .fillEqually
        vStackTime.spacing = 1
        
        let timeLabel = UILabel()
        timeLabel.text = "Time"
        timeLabel.textColor = DefaultTabColor
        timeLabel.font = FontExtraTiny
        
        let finalTime = UILabel()
        finalTime.text = "1h 3m"
        finalTime.textColor = DefaultBlack
        finalTime.font = FontMain
        
        vStackTime.addArrangedSubview(timeLabel)
        vStackTime.addArrangedSubview(finalTime)
        
        let sepLine1 = FPVerticalLine()
        let sepLine2 = FPVerticalLine()
        
        self.addArrangedSubview(vStackDist)
        self.addArrangedSubview(sepLine1)
        self.addArrangedSubview(vStackPace)
        self.addArrangedSubview(sepLine2)
        self.addArrangedSubview(vStackTime)
        
        sepLine1.mas_makeConstraints { (make) in
            make?.width.equalTo()(1)
            make?.height.equalTo()(26)
        }
        
        sepLine2.mas_makeConstraints { (make) in
            make?.width.equalTo()(1)
            make?.height.equalTo()(26)
        }
        
    }
    
}
