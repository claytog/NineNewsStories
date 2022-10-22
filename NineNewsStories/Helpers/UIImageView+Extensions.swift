//
//  UIImageView+Extensions.swift
//  NineNewsStories
//
//  Created by Clayton Gilbert on 22/10/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>() // cache images

extension UIImageView {

    func loadImageWithUrl(_ url: URL) {

        var imageURL: URL?

        let activityIndicator = UIActivityIndicatorView()
        
        // setup activityIndicator
        activityIndicator.color = .darkGray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        imageURL = url

        image = nil
        activityIndicator.startAnimating()

        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {

            self.image = imageFromCache
            activityIndicator.stopAnimating()
            return
        }

        // image does not available in cache, so retrieve it from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil {
                print(error as Any)
                DispatchQueue.main.async(execute: {
                    activityIndicator.stopAnimating()
                })
                return
            }

            DispatchQueue.main.async(execute: {

                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {

                    if imageURL == url {
                        self.image = imageToCache
                    }

                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
                activityIndicator.stopAnimating()
            })
        }).resume()
    }
}
