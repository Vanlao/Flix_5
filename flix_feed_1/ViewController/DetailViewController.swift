//
//  DetailViewController.swift
//  flix_feed_1
//
//  Created by Tu Pham on 10/1/18.
//  Copyright © 2018 Van Lao. All rights reserved.
//

import UIKit
//short key for values.
enum MovieKeys {
    static let T = "title"
    static let R = "release_date"
    static let O = "overview"
    static let B = "backdrop_path"
    static let P = "poster_path"
}

class DetailViewController: UIViewController {
    //all label for DetailViewController. a
    @IBOutlet weak var BackdropView: UIImageView!
    @IBOutlet weak var PosterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //var movieDetail: [String: Any]?
    var movieDetail: MovieModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieDetail = movieDetail {
            titleLabel.text = movieDetail.title as! String
            releaseDateLabel.text = movieDetail.ReleaseDate as! String
            overviewLabel.text = movieDetail.Overview as! String
            
            PosterView.af_setImage(withURL: movieDetail.posterUrl!)
            BackdropView.af_setImage(withURL: movieDetail.backdropUrl!)

        }
        
    } 
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
