import UIKit
import OPGGTestAssets

public final class SeparatorTableViewCell: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let contentView = self.contentView
        
        let view = SeparatorView()
        
        contentView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        self.selectionStyle = .none
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
