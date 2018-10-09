//
//  NowPlayingViewController.swift
//  flix_feed_1
//
//  Created by macstudent on 9/21/18.
//  Copyright © 2018 Van Lao. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [MovieModel] = []
    var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.PulledToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        FecthMovies()
    }
    
    
    @objc func PulledToRefresh(_ refreshControl: UIRefreshControl){
        FecthMovies()
    }
    
    
    func FecthMovies(){
        //requesting url from the API database
        
        movieAPIManager().nowPlayingMovies { (movies: [MovieModel]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCellsTableViewCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    // the next function prepare all the info about movie if DetailViewController is loaded.
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){ 
            let movie = movies[indexPath.row]
            let detailViewControl = segue.destination as! DetailViewController
            detailViewControl.movieDetail = movie
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
