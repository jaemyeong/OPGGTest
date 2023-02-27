import UIKit

public protocol ConfigurableCollectionViewItemIdentifier: AnyObject, Hashable {
    
    static var reuseIdentifier: String { get }
    
    var reuseIdentifier: String { get }
    
    func configure(_ cell: UICollectionViewCell)
}

extension ConfigurableCollectionViewItemIdentifier {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
    
    public var reuseIdentifier: String {
        Self.reuseIdentifier
    }
}
