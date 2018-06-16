import Foundation

extension Date {
    enum FormattedStyle {
        case longDate
        case longDateAndTime
        case shortDateAndTime
        case time
    }
    
    func format(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
    
    var formattedWeekday: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let symbol = formatter.weekdaySymbols[Calendar.current.component(.weekday, from: self) - 1] // needs '- 1'. '.weekday' returns an integer from 1 - 7, with 1 being Sunday and 7 being Saturday
        switch symbol {
        case    "Sunday": return "(日)"
        case    "Monday": return "(月)"
        case   "Tuesday": return "(火)"
        case "Wednesday": return "(水)"
        case  "Thursday": return "(木)"
        case    "Friday": return "(金)"
        case  "Saturday": return "(土)"
        default: assertionFailure("error"); return ""
        }
    }
    
    func formattedDateWith(style: FormattedStyle) -> String {
        switch style {
        case .longDate:
            return format(with: "yyyy/M/d\(formattedWeekday)")
        case .longDateAndTime:
            return format(with: "yyyy/M/d\(formattedWeekday) H:mm")
        case .shortDateAndTime:
            return format(with: "M/d\(formattedWeekday) H:mm")
        case .time:
            return format(with: "H:mm")
        }
    }
}
