//
//  CalendarView.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/29.
//

import UIKit
import FSCalendar

class CalendarView: UIView {
    
    var vc = UIViewController()
    
    fileprivate weak var calendar: FSCalendar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        backgroundColor = .black
        setCalendar()
    }
    
    func setConstraints() {
        calendar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(self)
        }
    }
    
    func setCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        self.addSubview(calendar)
        self.calendar = calendar
        self.calendar.backgroundColor = .white
        calendar.swipeToChooseGesture.isEnabled = true
        calendar.appearance.titleDefaultColor = .black  // 평일
        calendar.appearance.titleWeekendColor = .red    // 주말

        // 다중 선택
        calendar.allowsMultipleSelection = true

        // 꾹 눌러서 드래그 동작으로 다중 선택
        calendar.swipeToChooseGesture.isEnabled = true
    }
}

extension CalendarView: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendar.snp.updateConstraints { (make) in
            make.height.equalTo(bounds.height)
            // Do other updates
        }
        self.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        presentAlertOK(title: "select date", message: "", style: .alert, vc: vc)
    }
}
