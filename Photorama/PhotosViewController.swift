//
//  ViewController.swift
//  Photorama
//
//  Created by User on 09.12.2020.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterestingPhotos()
    }

    @IBAction func switcherTapped(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            loadInterestingPhotos()
        default:
            loadRecentPhotos()
        }
    }
    
    func loadInterestingPhotos(){
        store.fetchInterestingPhotos {
            (photosResult) in
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
            print("Error with photos \(error).")
            }
        }
    }
    
    func loadRecentPhotos(){
        store.fetchRecentPhotos {
            (photosResult) in
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
            print("Error with photos \(error).")
            }
        }
    }
    
    
    func updateImageView(for photo: Photo){
        store.fetchImage(for: photo) {
            (imageResult) in
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }

}

