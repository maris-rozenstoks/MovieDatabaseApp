//
//  MovieDetailViewController.swift
//  MovieDatabase
//
//  Created by maris.rozenstoks on 24/11/2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        DispatchQueue.main.async {
            self.titleLabel.text = self.movie?.title
            self.ratingLabel.text = "Rating: \(String(format: "%.2f", self.movie?.voteAverage ?? 0.0))"
            self.releaseDateLabel.text = "Release Date: \(self.movie?.releaseDate ?? "N/A")"
            self.descriptionLabel.text = self.movie?.overview ?? "No overview available"
            self.descriptionLabel.numberOfLines = 0 // Allow for multiple lines
            self.imageView.sd_setImage(with: URL(string: Constants.API.posterUrl.appending(self.movie?.posterPath ?? "")))
        }
    }
}
