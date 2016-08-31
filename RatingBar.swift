


//
//  RatingBar.swift
//  HiMove
//
//  Created by nihao on 16/8/31.
//  Copyright © 2016年 爱淘记. All rights reserved.
//

import UIKit

class RatingBar: UIView {
    
    var unSelectedImage,halfSelectedImage,fullSelectedImage:UIImage?
    var barHeight:CGFloat = 0.0
    var barWidth:CGFloat = 0.0
    var starRating:Float = 0.0
    var lastRating:Float = 0.0
    //评星间距
    var barMargin:CGFloat = 2.0
    var s1,s2,s3,s4,s5 :UIImageView?
    var isIndicator:Bool = false
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    /**
     *  初始化设置未选中图片、半选中图片、全选中图片，以及评分值改变的代理（可以用
     *  Block）实现
     *
     *  @param deselectedName   未选中图片名称
     *  @param halfSelectedName 半选中图片名称
     *  @param fullSelectedName 全选中图片名称
     *  @param delegate          代理
     */
    func setImage(deselectedName:String,halfSelectedName:String,fullSelectedName:String){
        
        unSelectedImage = UIImage(named:deselectedName)
        halfSelectedImage =  halfSelectedName.isEmpty==true ?unSelectedImage:UIImage(named:halfSelectedName)
        fullSelectedImage = UIImage(named:fullSelectedName)
        let fullSize:CGSize = (fullSelectedImage?.size)!
        
        if (barHeight < fullSize.height) {
            
            barHeight = fullSize.height;
        }
        if (barWidth < fullSize.width) {
            barWidth = fullSize.width;
        }
        
        s1 = UIImageView(frame:CGRectMake(0, 0, barWidth, barHeight))
        s1?.image = unSelectedImage
        s1?.userInteractionEnabled = false
        s2 = UIImageView(frame:CGRectMake(barMargin*1+barWidth*1, 0, barWidth, barHeight))
        s2?.image = unSelectedImage
        s2?.userInteractionEnabled = false
        s3 = UIImageView(frame:CGRectMake(barMargin*2+barWidth*2, 0, barWidth, barHeight))
        s3?.image = unSelectedImage
        s3?.userInteractionEnabled = false
        s4 = UIImageView(frame:CGRectMake(barMargin*3+barWidth*3, 0, barWidth, barHeight))
        s4?.image = unSelectedImage
        s4?.userInteractionEnabled = false
        s5 = UIImageView(frame:CGRectMake(barMargin*4+barWidth*4, 0, barWidth, barHeight))
        s5?.image = unSelectedImage
        s5?.userInteractionEnabled = false
        
        self.addSubview(s1!)
        self.addSubview(s2!)
        self.addSubview(s3!)
        self.addSubview(s4!)
        self.addSubview(s5!)
        
        
        
        var frame = self.frame
        frame.size.width = barMargin*4 + barWidth*5
        frame.size.height = barHeight
        self.frame = frame
        self.layoutIfNeeded()
        //加入单击手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RatingBar.tapRateView(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)

    }
    /**
     *  设置评分值
     *
     *  @param rating 评分值
     */
    func displayRating(rating:Float){
        
        if rating>=0 && rating<=1 {
            s1?.image = fullSelectedImage
            s2?.image = unSelectedImage
            s3?.image = unSelectedImage
            s4?.image = unSelectedImage
            s5?.image = unSelectedImage
        }else if rating>1 && rating<=2{
            s1?.image = fullSelectedImage
            s2?.image = fullSelectedImage
            s3?.image = unSelectedImage
            s4?.image = unSelectedImage
            s5?.image = unSelectedImage
        }else if rating>2 && rating<=3{
            
            s1?.image = fullSelectedImage
            s2?.image = fullSelectedImage
            s3?.image = fullSelectedImage
            s4?.image = unSelectedImage
            s5?.image = unSelectedImage
        }else if rating>3 && rating<=4{
            
            s1?.image = fullSelectedImage
            s2?.image = fullSelectedImage
            s3?.image = fullSelectedImage
            s4?.image = fullSelectedImage
            s5?.image = unSelectedImage
        }else{
            
            s1?.image = fullSelectedImage
            s2?.image = fullSelectedImage
            s3?.image = fullSelectedImage
            s4?.image = fullSelectedImage
            s5?.image = fullSelectedImage
        }
        starRating = rating;
        lastRating = rating;
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if isIndicator {return}//如果是指示器，就不能交互
        let point = (touches as NSSet).anyObject()?.locationInView(self)
        let offset = point!.x
        self.updateRat(offset)
        
    }
    func tapRateView(sender: UITapGestureRecognizer){
        if isIndicator {return}//如果是指示器，就不能交互
        let tapPoint = sender.locationInView(self)
        let offset = tapPoint.x
        self.updateRat(offset)
    }
    //修改评星数量
    func  updateRat(offset:CGFloat){
        
        if offset>=0 && offset<=barWidth {
            self.displayRating(1)
        }else if  offset>=barWidth+barMargin && offset<=barWidth*2+barMargin
        {
            self.displayRating(2)
        }else if offset>=barWidth*2+barMargin*2 && offset<=barWidth*3+barMargin*2
        {
            self.displayRating(3)
        }else if offset>=barWidth*3+barMargin*3 && offset<=barWidth*4+barMargin*3
        {
            self.displayRating(4)
        }else if offset>=barWidth*4+barMargin*4 && offset<=barWidth*5+barMargin*4{
            self.displayRating(5)
        }else{
        }
        
    }
}
