import UIKit
import RxSwift
import RxCocoa
import OPGGTestAPIKit

public final class GameViewModel: ConfigurableTableViewItemIdentifier {
    
    public let isWin: Bool
    
    public let kill: Int
    
    public let death: Int
    
    public let assist: Int
    
    public let killRate: String
    
    public let gameType: String
    
    public let createDate: Date
    
    public let championImage: BehaviorRelay<UIImage?>
    
    public let itemsImage: BehaviorRelay<[UIImage?]>
    
    public let trinketItemImage: BehaviorRelay<UIImage?>
    
    public let spellsImage: BehaviorRelay<[UIImage?]>
    
    public let peakImage: BehaviorRelay<[UIImage?]>
    
    public let largestMultiKillString: String
    
    public let opScoreBadge: String
    
    public let gameLength: TimeInterval
    
    public init(
        isWin: Bool,
        kill: Int,
        death: Int,
        assist: Int,
        killRate: String,
        gameType: String,
        createDate: Date,
        championImageURL: URL,
        itemsImageURL: [URL],
        spellsImageURL: [URL],
        peakURL: [URL],
        largestMultiKillString: String,
        opScoreBadge: String,
        gameLength: TimeInterval
    ) {
        self.championImage = BehaviorRelay(value: nil)
        self.itemsImage = BehaviorRelay(value: [nil, nil, nil, nil, nil, nil, nil])
        self.trinketItemImage = BehaviorRelay(value: nil)
        self.spellsImage = BehaviorRelay(value: [nil, nil])
        self.peakImage = BehaviorRelay(value: [nil, nil])
        self.isWin = isWin
        self.kill = kill
        self.death = death
        self.assist = assist
        self.killRate = killRate
        self.gameType = gameType
        self.createDate = createDate
        self.largestMultiKillString = largestMultiKillString
        self.opScoreBadge = opScoreBadge
        self.gameLength = gameLength
        
        OPGGTestAPIProvider.shared.download(url: championImageURL) { result in
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
            
            self.championImage.accept(image)
        }
        
        itemsImageURL.dropLast().enumerated().forEach { offset, element in
            OPGGTestAPIProvider.shared.download(url: element) { result in
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
                
                var itemsImage = self.itemsImage.value
                itemsImage[offset] = image
                
                self.itemsImage.accept(itemsImage)
            }
        }
        
        OPGGTestAPIProvider.shared.download(url: itemsImageURL.last!) { result in
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
            
            self.trinketItemImage.accept(image)
        }
        
        spellsImageURL.enumerated().forEach { offset, element in
            OPGGTestAPIProvider.shared.download(url: element) { result in
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
                
                var spellsImage = self.spellsImage.value
                spellsImage[offset] = image
                
                self.spellsImage.accept(spellsImage)
            }
        }
        
        peakURL.enumerated().forEach { offset, element in
            OPGGTestAPIProvider.shared.download(url: element) { result in
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
                
                var peakImage = self.peakImage.value
                peakImage[offset] = image
                
                self.peakImage.accept(peakImage)
            }
        }
    }
    
    public func configure(_ cell: UITableViewCell) {
        guard let cell = cell as? GameTableViewCell else {
            return
        }
        cell.viewModel = self
    }
}

extension GameViewModel: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension GameViewModel: Equatable {
    
    public static func == (lhs: GameViewModel, rhs: GameViewModel) -> Bool {
        lhs === rhs
    }
}
