//
//  FPWeeklyStatusCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit
import Charts

class FPWeeklyStatusCell: UICollectionViewCell {
    
    let lineChartView = LineChartView()
    var lineDataEntry = [ChartDataEntry]()
    var statusView: FPFeedStatusView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = DefaultWhite
        let titleLabel = UILabel()
        titleLabel.text = "This Week"
        titleLabel.textColor = DefaultBlack
        titleLabel.font = FontSmallTitle
        
        self.addSubview(titleLabel)
        titleLabel.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.contentView)?.offset()(16)
            make?.left.equalTo()(self.contentView)?.offset()(16)
        }
        
        statusView = FPFeedStatusView()
        self.addSubview(statusView!)
        statusView?.mas_makeConstraints { (make) in
            make?.top.equalTo()(titleLabel)?.offset()(16)
            make?.left.equalTo()(self.contentView)?.offset()(16)
            make?.right.equalTo()(self.contentView)?.offset()(-UIScreen.main.bounds.width * 0.2)
            make?.height.equalTo()(60)
        }
        
        setupLineChart()
    }
    
    func setupLineChart() {
        self.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        lineChartView.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.statusView?.mas_bottom)?.offset()(10)
            make?.left.equalTo()(self.contentView)
            make?.right.equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)
        }
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInSine)
        self.setLineChart()
    }
    
    func setLineChart() {
        lineChartView.noDataTextColor = DefaultWhite!
        lineChartView.noDataText = "No Exercise Data yet"
        lineChartView.backgroundColor = DefaultWhite
        
        for i in 0...7 {
            let dataPoint = ChartDataEntry(x: Double(i), y: 10)
            lineDataEntry.append(dataPoint)
        }
        
        let chartDataSet = LineChartDataSet(entries: lineDataEntry, label: "BPM")
        let chartData = LineChartData()
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(true)
        chartDataSet.colors = [DefaultBlue!]
        chartDataSet.setCircleColor(DefaultBlue!)
        chartDataSet.circleRadius = 4.0
        chartDataSet.circleHoleColor = DefaultBlue!
        
        let gradColors = [DefaultBlue?.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0]
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradColors, locations: colorLocations) else {
            print("err")
            return
        }
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        chartDataSet.drawFilledEnabled = true
        
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        
        lineChartView.chartDescription?.enabled = false
        lineChartView.legend.enabled = true
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawLabelsEnabled = false
        lineChartView.data = chartData
    }
    
}
