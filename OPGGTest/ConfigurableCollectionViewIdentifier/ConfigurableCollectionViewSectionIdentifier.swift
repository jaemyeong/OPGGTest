import UIKit

public protocol ConfigurableCollectionViewSectionIdentifier: AnyObject, Hashable {
    
    static var reuseIdentifier: String { get }
    
    var reuseIdentifier: String { get }
    
    func configure(_ reusableView: UICollectionReusableView)
}

extension ConfigurableCollectionViewSectionIdentifier {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
    
    public var reuseIdentifier: String {
        Self.reuseIdentifier
    }
}
