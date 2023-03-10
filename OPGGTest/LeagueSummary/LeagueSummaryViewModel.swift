import UIKit
import RxSwift
import RxCocoa
import OPGGTestAPIKit

public final class LeagueSummaryViewModel: ConfigurableCollectionViewItemIdentifier {
    
    public let image: BehaviorRelay<UIImage?>
    
    public let rankName: String
    
    public let tier: String
    
    public let leaguePoint: Int
    
    public let win: Int
    
    public let lose: Int
    
    public init(rankName: String, tier: String, leaguePoint: Int, win: Int, lose: Int, imageURL: URL) {
        self.image = BehaviorRelay(value: nil)
        self.rankName = rankName
        self.tier = tier
        self.leaguePoint = leaguePoint
        self.win = win
        self.lose = lose
        
        OPGGTestAPIProvider.shared.download(url: imageURL) { result in
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
            
            self.image.accept(image)
        }
    }
    
    public func configure(_ cell: UICollectionViewCell) {
        guard let cell = cell as? LeagueSummaryCollectionViewCell else {
            return
        }
        cell.viewModel = self
    }
}

extension LeagueSummaryViewModel: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension LeagueSummaryViewModel: Equatable {
    
    public static func == (lhs: LeagueSummaryViewModel, rhs: LeagueSummaryViewModel) -> Bool {
        lhs === rhs
    }
}
