import UIKit
import RxSwift
import RxCocoa
import OPGGTestAPIKit

public final class SummonerProfileViewModel: ConfigurableTableViewSectionIdentifier {
    
    public let profileImage: BehaviorRelay<UIImage?>
    
    public let level: Int
    
    public let name: String
    
    public weak var delegate: SummonerProfileViewModelDelegate?
    
    public init(profileImageURL: URL, level: Int, name: String, delegate: SummonerProfileViewModelDelegate? = nil) {
        self.profileImage = BehaviorRelay(value: nil)
        self.level = level
        self.name = name
        self.delegate = delegate
        
        OPGGTestAPIProvider.shared.download(url: profileImageURL) { result in
            guard case .success(let url) = result else {
                return
            }
            
            guard let toURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(url.lastPathComponent).appendingPathExtension(url.pathExtension) else {
                return
            }
            
            let image: UIImage
            
            if FileManager.default.fileExists(atPath: toURL.relativePath) {
                image = UIImage(contentsOfFile: toURL.relativePath)!
            } else {
                do {
                    try FileManager.default.copyItem(atPath: url.relativePath, toPath: toURL.relativePath)
                } catch {
                    logger.error("\(error)")
                    
                    return
                }
                
                image = UIImage(contentsOfFile: toURL.relativePath)!
            }
            
            self.profileImage.accept(image)
        }
    }
    
    public func configure(_ headerFooterView: UITableViewHeaderFooterView) {
        guard let headerFooterView = headerFooterView as? SummonerProfileTableViewHeaderView else {
            return
        }
        headerFooterView.viewModel = self
    }
    
    public func onRefresh() {
        self.delegate?.onRefresh(in: self)
    }
}

extension SummonerProfileViewModel: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.level)
        hasher.combine(self.name)
    }
}

extension SummonerProfileViewModel: Equatable {
    
    public static func == (lhs: SummonerProfileViewModel, rhs: SummonerProfileViewModel) -> Bool {
        lhs.level == rhs.level &&
        lhs.name == rhs.name
    }
}
