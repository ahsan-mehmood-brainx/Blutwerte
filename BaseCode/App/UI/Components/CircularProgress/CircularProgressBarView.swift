//
//  CircularProgressBarView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 29/08/2023.
//

import UIKit

class CircularProgressBarView: UIView {
    
    //MARK: - Properties

    private let progressLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()

    var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    var trackColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }

    //MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCircularPath()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeCircularPath()
    }

    //MARK: - Public Methods

    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }

    //MARK: - Private Methods

    private func makeCircularPath() {
        backgroundColor = UIColor.clear
        layer.cornerRadius = frame.size.width/2
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: (frame.size.width - 1.5) / 2.0,
            startAngle: CGFloat(1.5 * .pi),
            endAngle: CGFloat(-0.5 * .pi),
            clockwise: false
        )
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 2.0
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)

        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 2.0
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
}
