//
//  VideoTableViewCell.swift
//  Youtube Clone
//
//  Created by zero on 25/03/21.
//

import UIKit

class videoTableViewCell: UITableViewCell{
    @IBOutlet weak var tumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(_ v:Video){
        self.video = v
        
        guard self.video != nil else{
            return
        }
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        guard self.video!.thumbnail != "" else{
            return
        }
        
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            self.tumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) {( data , response,error) in
            if error == nil && data != nil {
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.tumbnailImageView.image = image
                    
                }
            }
            
        }
        dataTask.resume()
        
    }
    
}

