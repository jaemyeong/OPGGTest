import UIKit

public protocol ConfigurableTableViewItemIdentifier: AnyObject, Hashable {
    
    static var reuseIdentifier: String { get }
    
    var reuseIdentifier: String { get }
    
    func configure(_ cell: UITableViewCell)
}

extension ConfigurableTableViewItemIdentifier {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
    
    public var reuseIdentifier: String {
        Self.reuseIdentifier
    }
}
