# swift-    


//
    private lazy var ratingBar:RatingBar = {
        let bar = RatingBar(frame:CGRectMake(0, 100,100,15))
        bar.setImage("ic_ratingbar_star_dark", fullSelectedName: "ic_ratingbar_star_light")
        bar.displayRating(4)
        bar.barMargin = 4.0
        bar.isIndicator = true
        return bar
    }()×
