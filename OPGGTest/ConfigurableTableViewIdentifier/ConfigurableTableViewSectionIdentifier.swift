import UIKit

public protocol ConfigurableTableViewSectionIdentifier: AnyObject, Hashable {
    
    static var reuseIdentifier: String { get }
    
    var reuseIdentifier: String { get }
    
    func configure(_ headerFooterView: UITableViewHeaderFooterView)
}

extension ConfigurableTableViewSectionIdentifier {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
    
    public var reuseIdentifier: String {
        Self.reuseIdentifier
    }
}
