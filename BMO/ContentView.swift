//
//  ContentView.swift
//  BMO
//
//  Created by Hydee Chen on 2023/6/13.
//
//複製貼上peter的程式可直接預覽結果。

import SwiftUI

struct DrawView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        // 以上不要動

        // 這邊參考資料宣告一個 containerView 的 UIView 物件，之後要把所有寫好的 layer 都放在它裡面，如此即可輕易透過 CGAffineTransform 移到任意位置。
        let containerView = UIView()

        
        
        //後面身體
        containerView.layer.addSublayer(addBackBody())
        
        // 臉部分
        containerView.layer.addSublayer(addBody())
        
        // 顯示淡淡的原圖
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 390, height: 495))
        imageView.image = UIImage(named: "BMO")
        imageView.alpha = 0
        view.addSubview(imageView)

        //螢幕
        containerView.layer.addSublayer(addFace())
        
        //addCircle1()
        containerView.layer.addSublayer(addCircle1())
        
        //addCircle1()
        containerView.layer.addSublayer(addCircle2())
        
        //addmounth()
        containerView.layer.addSublayer(addmounth())
        
        //addEquipment1()
        containerView.layer.addSublayer(addEquipment1())
       
        //addCircle3()
        containerView.layer.addSublayer(addCircle3())
        
        //addCircle4()
        containerView.layer.addSublayer(addCircle4())
        
        //addCircle5()
        containerView.layer.addSublayer(addCircle5())
        
        //addEquipment2()
        containerView.layer.addSublayer(addEquipment2())
        
        //addEquipment3()
        containerView.layer.addSublayer(addEquipment3())
        
        //addEquipment4()
        containerView.layer.addSublayer(addEquipment4())
        
        //addSpeaker()
        containerView.layer.addSublayer(addSpeaker())
        
        //addBMO()
        containerView.layer.addSublayer(addBMO())
        
        //addCircleB
        containerView.layer.addSublayer(addCircleB())
        
        //addHandAndFeet()
        containerView.layer.addSublayer(addHandAndFeet())
        
        //因為動畫所以先註解掉
        /*
        //addRightHand()
        containerView.layer.addSublayer(addRightHand())
         */
        
        //把bmo右邊的手獨立做成view
        let rightMoveView = UIView(frame: CGRect(x: 0, y: 0, width:0, height: 0))
        rightMoveView.transform = CGAffineTransform.identity.translatedBy(x: 0, y: 0).scaledBy(x: 1, y: 1).rotated(by: CGFloat.pi/180*0.2)
        rightMoveView.layer.addSublayer(addRightHand())
       
        containerView.addSubview(rightMoveView)
        
        
        //動畫
        UIView.animate(withDuration: 0.2, delay: 0, options:  .repeat) {
            rightMoveView.transform = CGAffineTransform.identity.translatedBy(x: 0, y: 0).scaledBy(x: 1, y: 1).rotated(by: CGFloat.pi/180*0.1)
            rightMoveView.frame = CGRect(x: -4, y: -2, width: 0, height: 0)
        }
        
        
        // 以下不要動
        view.addSubview(containerView)
        return view
    }

    // 從這邊開始插入自己的 function

    // 身體
    func addBody() -> CAShapeLayer {
        let path = UIBezierPath()

        //正面身體
        path.move(to: CGPoint(x: 55, y: 80))
        path.addQuadCurve(to: CGPoint(x: 70, y: 55), controlPoint: CGPoint(x: 55, y: 60))
        path.addLine(to: CGPoint(x: 170, y: 35))
        path.addQuadCurve(to: CGPoint(x: 220, y: 80), controlPoint: CGPoint(x: 220, y: 30))
        path.addLine(to: CGPoint(x: 230, y: 360))
        path.addQuadCurve(to: CGPoint(x: 200, y: 385), controlPoint: CGPoint(x: 230, y: 380))
        path.addLine(to: CGPoint(x: 95, y: 390))
        path.addQuadCurve(to: CGPoint(x: 73, y: 370), controlPoint: CGPoint(x: 73, y: 385))
        path.close()
        
        // 敘述顯示的code
        let bodyLayer = CAShapeLayer()
        bodyLayer.fillColor = UIColor(red: 0/255, green: 178/255, blue: 166/255, alpha: 1).cgColor
        bodyLayer.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        bodyLayer.lineWidth = 5
        bodyLayer.path = path.cgPath
        return bodyLayer
    }
    
    //後面軀幹
    func addBackBody() -> CAShapeLayer {
        let path = UIBezierPath()
        //軀幹
        path.move(to: CGPoint(x: 170, y: 35))
        path.addLine(to: CGPoint(x: 270, y: 40))
        path.addQuadCurve(to: CGPoint(x: 310, y: 70), controlPoint: CGPoint(x: 310 , y: 36))
        path.addLine(to: CGPoint(x: 320, y: 350))
        path.addQuadCurve(to: CGPoint(x: 300, y: 370), controlPoint: CGPoint(x: 320 , y: 370))
        path.addLine(to: CGPoint(x: 200 , y: 380))
        
        // 敘述顯示的code
        let backBodyLayer = CAShapeLayer()
        backBodyLayer.fillColor = UIColor(red: 0/255, green: 149/255, blue: 158/255, alpha: 0.5).cgColor
        backBodyLayer.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        backBodyLayer.lineWidth = 5
        backBodyLayer.path = path.cgPath

        return backBodyLayer
    }
    //小螢幕
    func addFace() -> CAShapeLayer {
        let path = UIBezierPath()
        //螢幕
        path.move(to: CGPoint(x: 80, y: 80*1.5))
        path.addQuadCurve(to: CGPoint(x: 95, y: 80), controlPoint: CGPoint(x: 75, y: 80))
        path.addLine(to: CGPoint(x: 170, y: 65))
        path.addQuadCurve(to: CGPoint(x: 185, y: 90), controlPoint: CGPoint(x: 185, y: 70))
        path.addLine(to: CGPoint(x: 190, y: 180))
        path.addQuadCurve(to: CGPoint(x: 180, y: 190), controlPoint: CGPoint(x: 190, y: 189))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addQuadCurve(to: CGPoint(x: 83, y: 180), controlPoint: CGPoint(x: 85, y: 200))
        path.addLine(to: CGPoint(x: 80, y: 80*1.5))
        
        // 敘述顯示的code
        let faceLayer = CAShapeLayer()
        faceLayer.fillColor = UIColor(red: 179/255, green: 224/255, blue: 204/255, alpha: 1).cgColor
        faceLayer.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        faceLayer.lineWidth = 5
        faceLayer.path = path.cgPath

        return faceLayer
    }
    
    //眼睛1&2
    func addCircle1() -> CAShapeLayer {
        let circle1Path = UIBezierPath(ovalIn: CGRect(x: 100, y: 113, width: 10, height: 10))

        let circle1Layer = CAShapeLayer()
        circle1Layer.fillColor = UIColor.black.cgColor
        circle1Layer.strokeColor = UIColor.black.cgColor
        circle1Layer.lineWidth = 2
        circle1Layer.path = circle1Path.cgPath

        return circle1Layer
    }
    func addCircle2() -> CAShapeLayer {
        let circle2Path = UIBezierPath(ovalIn: CGRect(x: 155, y: 105, width: 10, height: 10))

        let circle2Layer = CAShapeLayer()
        circle2Layer.fillColor = UIColor.black.cgColor
        circle2Layer.strokeColor = UIColor.black.cgColor
        circle2Layer.lineWidth = 2
        circle2Layer.path = circle2Path.cgPath

        return circle2Layer
    }
    
    //嘴巴
    func addmounth() -> CAShapeLayer {
        let path = UIBezierPath()
        //螢幕
        path.move(to: CGPoint(x: 135, y: 138))
        path.addQuadCurve(to: CGPoint(x: 120, y: 150), controlPoint: CGPoint(x: 107, y: 127))
        path.addQuadCurve(to: CGPoint(x: 155, y: 150), controlPoint: CGPoint(x: 140, y: 170))
        path.addQuadCurve(to: CGPoint(x: 135, y: 138), controlPoint: CGPoint(x: 165, y: 120))
        path.close()
        
        
        // 敘述顯示的code
        let mounthLayer = CAShapeLayer()
        mounthLayer.fillColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        mounthLayer.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        mounthLayer.lineWidth = 1
        mounthLayer.path = path.cgPath

        return mounthLayer
    }
    
    //身上零件-小長條
    func addEquipment1() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 85, y: 230))
        path.addLine(to: CGPoint(x: 150, y: 220))
        path.addLine(to: CGPoint(x: 150, y: 240))
        path.addLine(to: CGPoint(x: 85, y: 250))
        path.close()
        
        // 敘述顯示的code
        let EquipmentLayer1 = CAShapeLayer()
        EquipmentLayer1.fillColor = UIColor(red: 0/255, green: 72/255, blue: 52/255, alpha: 1).cgColor
        EquipmentLayer1.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        EquipmentLayer1.lineWidth = 5
        EquipmentLayer1.path = path.cgPath

        return EquipmentLayer1
    }
    
    //身上零件-深色圈圈
    func addCircle3() -> CAShapeLayer {
        let circle3Path = UIBezierPath(ovalIn: CGRect(x: 180, y: 230, width: 20, height: 20))

        let circle3Layer = CAShapeLayer()
        circle3Layer.fillColor = UIColor(red: 1/255, green: 88/255, blue: 108/255, alpha: 1).cgColor
        circle3Layer.strokeColor = UIColor.black.cgColor
        circle3Layer.lineWidth = 5
        circle3Layer.path = circle3Path.cgPath

        return circle3Layer
    }
    //身上零件-綠圈圈
    func addCircle4() -> CAShapeLayer {
        let circle4Path = UIBezierPath(ovalIn: CGRect(x: 180, y: 300, width: 20, height: 20))

        let circle4Layer = CAShapeLayer()
        circle4Layer.fillColor = UIColor(red: 1/255, green: 208/255, blue: 0/255, alpha: 1).cgColor
        circle4Layer.strokeColor = UIColor.black.cgColor
        circle4Layer.lineWidth = 5
        circle4Layer.path = circle4Path.cgPath

        return circle4Layer
    }
    
    //身上零件-紅色圈圈
    func addCircle5() -> CAShapeLayer {
        let circle5Path = UIBezierPath(ovalIn: CGRect(x: 150, y: 325, width: 35, height: 35))
        let circle5Layer = CAShapeLayer()
        circle5Layer.fillColor = UIColor.red.cgColor
        circle5Layer.strokeColor = UIColor.black.cgColor
        circle5Layer.lineWidth = 5
        circle5Layer.path = circle5Path.cgPath

        return circle5Layer
    }
    
    //身上零件-下方兩個小長條
    func addEquipment2() -> CAShapeLayer {
        let path = UIBezierPath()
        //小條條左
        path.move(to: CGPoint(x: 85, y: 355))
        path.addLine(to: CGPoint(x: 105, y: 355))
        path.addLine(to: CGPoint(x: 105, y: 365))
        path.addLine(to: CGPoint(x: 85, y: 365))
        path.close()
        
        //小條條右
        path.move(to: CGPoint(x: 116, y: 350))
        path.addLine(to: CGPoint(x: 136, y: 350))
        path.addLine(to: CGPoint(x: 136, y: 360))
        path.addLine(to: CGPoint(x: 116, y: 360))
        path.close()
        
        // 敘述顯示的code
        let EquipmentLayer2 = CAShapeLayer()
        EquipmentLayer2.fillColor = UIColor(red: 5/255, green: 90/255, blue: 111/255, alpha: 1).cgColor
        EquipmentLayer2.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        EquipmentLayer2.lineWidth = 5
        EquipmentLayer2.path = path.cgPath

        return EquipmentLayer2
    }
    
    //身上零件-三角形
    func addEquipment3() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 170, y: 300))
        path.addLine(to: CGPoint(x: 150, y: 300))
        path.addLine(to: CGPoint(x: 160, y: 280))
        path.close()
        
        // 敘述顯示的code
        let EquipmentLayer3 = CAShapeLayer()
        EquipmentLayer3.fillColor = UIColor(red: 5/255, green: 184/255, blue: 214/255, alpha: 1).cgColor
        EquipmentLayer3.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        EquipmentLayer3.lineWidth = 5
        EquipmentLayer3.path = path.cgPath

        return EquipmentLayer3
    }
    
    //身上零件-十字架
    func addEquipment4() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 280))
        path.addLine(to: CGPoint(x: 110, y: 280))
        path.addLine(to: CGPoint(x: 110, y: 290))
        path.addLine(to: CGPoint(x: 120, y: 290))
        path.addLine(to: CGPoint(x: 120, y: 300))
        path.addLine(to: CGPoint(x: 110, y: 300))
        path.addLine(to: CGPoint(x: 110, y: 310))
        path.addLine(to: CGPoint(x: 100, y: 310))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 90, y: 300))
        path.addLine(to: CGPoint(x: 90, y: 290))
        path.addLine(to: CGPoint(x: 100, y: 290))
        path.addLine(to: CGPoint(x: 100, y: 278))
      
        
        // 敘述顯示的code
        let EquipmentLayer4 = CAShapeLayer()
        EquipmentLayer4.fillColor = UIColor(red: 255/255, green: 205/255, blue: 32/255, alpha: 1).cgColor
        EquipmentLayer4.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        EquipmentLayer4.lineWidth = 5
        EquipmentLayer4.path = path.cgPath

        return EquipmentLayer4
    }
    
    //BMO的喇叭
    func addSpeaker() -> CAShapeLayer {
        let path = UIBezierPath()
        //第一個小點
            let speaker1Path = UIBezierPath(ovalIn: CGRect(x: 250, y: 80, width: 10, height: 10))
            path.append(speaker1Path)
            
        //第二個小點
            let speaker2Path = UIBezierPath(ovalIn: CGRect(x: 275, y: 80, width: 10, height: 10))
            path.append(speaker2Path)
        
        //第三個小點
            let speaker3Path = UIBezierPath(ovalIn: CGRect(x: 295, y: 115, width: 10, height: 10))
            path.append(speaker3Path)
        
        //第四個小點
            let speaker4Path = UIBezierPath(ovalIn: CGRect(x: 265, y: 115, width: 10, height: 10))
            path.append(speaker4Path)
        
        //第五個小點
            let speaker5Path = UIBezierPath(ovalIn: CGRect(x: 235, y: 120, width: 10, height: 10))
            path.append(speaker5Path)
        
        //第六個小點
            let speaker6Path = UIBezierPath(ovalIn: CGRect(x: 252, y: 153, width: 10, height: 10))
            path.append(speaker6Path)
        
        //第七個小點
            let speaker7Path = UIBezierPath(ovalIn: CGRect(x: 280, y: 153, width: 10, height: 10))
            path.append(speaker7Path)
        
            
            let speakerLayer = CAShapeLayer()
            speakerLayer.fillColor = UIColor.black.cgColor
            speakerLayer.strokeColor = UIColor.black.cgColor
            speakerLayer.lineWidth = 2
            speakerLayer.path = path.cgPath
            
            return speakerLayer
    }
    
    //bmo側身英文字母
    func addBMO() -> CAShapeLayer {
        let path = UIBezierPath()
        
        //B
        path.move(to: CGPoint(x: 250, y: 180))
        path.addLine(to: CGPoint(x: 288, y: 178))
        path.addQuadCurve(to: CGPoint(x: 272, y: 200), controlPoint: CGPoint(x: 295, y: 230))
        path.addQuadCurve(to: CGPoint(x: 252, y: 200), controlPoint: CGPoint(x: 262, y: 226))
        path.addLine(to: CGPoint(x: 250, y: 178))
        
        //M
        path.move(to: CGPoint(x: 255, y: 220))
        path.addLine(to: CGPoint(x: 292, y: 220))
        path.addLine(to: CGPoint(x: 292, y: 236))
        path.addLine(to: CGPoint(x: 283, y: 244))
        path.addLine(to: CGPoint(x: 292, y: 250))
        path.addLine(to: CGPoint(x: 292, y: 273))
        path.addLine(to: CGPoint(x: 292, y: 273))
        path.addLine(to: CGPoint(x: 292, y: 273))
        path.addLine(to: CGPoint(x: 258, y: 275))
        path.addLine(to: CGPoint(x: 258, y: 258))
        path.addLine(to: CGPoint(x: 275, y: 258))
        path.addLine(to: CGPoint(x: 260, y: 250))
        path.addLine(to: CGPoint(x: 260, y: 250))
        path.addLine(to: CGPoint(x: 271, y: 240))
        path.addLine(to: CGPoint(x: 255, y: 240))
        path.close()
        
        //O
        let circle8Path = UIBezierPath(ovalIn: CGRect(x: 260, y: 285, width: 35, height: 50))
        let circle8Layer = CAShapeLayer()
        circle8Layer.fillColor = UIColor.red.cgColor
        circle8Layer.strokeColor = UIColor.black.cgColor
        circle8Layer.lineWidth = 5
        path.append(circle8Path)
        
        // 敘述顯示的code
        let BMOLayer = CAShapeLayer()
        BMOLayer.fillColor = UIColor(red: 5/255, green: 90/255, blue: 111/255, alpha: 1).cgColor
        BMOLayer.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        BMOLayer.lineWidth = 5
        BMOLayer.path = path.cgPath

        return BMOLayer
    }
    
    //bmo的b細節
    func addCircleB() -> CAShapeLayer {
        let path = UIBezierPath()
        //第一個小細節
        path.move(to: CGPoint(x: 260, y: 190))
        path.addLine(to: CGPoint(x: 265, y: 190))
        path.addQuadCurve(to: CGPoint(x: 260, y: 190), controlPoint: CGPoint(x: 265, y: 210))
        
        //第二個小細節
        path.move(to: CGPoint(x: 277, y: 190))
        path.addLine(to: CGPoint(x: 283, y: 190))
        path.addQuadCurve(to: CGPoint(x: 277, y: 190), controlPoint: CGPoint(x: 280, y: 210))
        
        
        // 敘述顯示的code
        let circleBLayer = CAShapeLayer()
        circleBLayer.fillColor = UIColor(red: 0/255, green: 149/255, blue: 158/255, alpha: 0.5).cgColor
        circleBLayer.strokeColor = UIColor.black.cgColor
        circleBLayer.lineWidth = 3
        circleBLayer.path = path.cgPath

        return circleBLayer
    }
    
    //手與腳
    func addHandAndFeet() -> CAShapeLayer {
        let path = UIBezierPath()
        
        //左邊手
        path.move(to: CGPoint(x:68, y: 300))
        path.addQuadCurve(to: CGPoint(x: 35, y: 445), controlPoint: CGPoint(x:30, y: 330))
        path.addQuadCurve(to: CGPoint(x: 40, y: 430), controlPoint: CGPoint(x:37, y: 445))
        path.addQuadCurve(to: CGPoint(x: 47, y: 425), controlPoint: CGPoint(x:45, y: 460))
        path.addQuadCurve(to: CGPoint(x: 53, y: 425), controlPoint: CGPoint(x:50, y: 460))
        path.addQuadCurve(to: CGPoint(x: 68, y: 330), controlPoint: CGPoint(x:50, y: 350))
        
        //左邊腳
        path.move(to: CGPoint(x:147, y: 390))
        path.addQuadCurve(to: CGPoint(x: 147, y: 450), controlPoint: CGPoint(x:142, y: 420))
        path.addQuadCurve(to: CGPoint(x: 140, y: 465), controlPoint: CGPoint(x:110, y: 450))
        path.addQuadCurve(to: CGPoint(x: 160, y: 465), controlPoint: CGPoint(x:156, y: 470))
        path.addQuadCurve(to: CGPoint(x: 160, y: 465), controlPoint: CGPoint(x:156, y: 470))
        path.addQuadCurve(to: CGPoint(x: 162, y: 388), controlPoint: CGPoint(x:157, y: 400))
        
        //右邊腳
        path.move(to: CGPoint(x:240, y: 378))
        path.addQuadCurve(to: CGPoint(x: 240, y: 452), controlPoint: CGPoint(x:235, y: 420))
        path.addQuadCurve(to: CGPoint(x: 240, y: 470), controlPoint: CGPoint(x:210, y: 470))
        path.addQuadCurve(to: CGPoint(x: 255, y: 470), controlPoint: CGPoint(x:248, y: 470))
        path.addQuadCurve(to: CGPoint(x: 256, y: 450), controlPoint: CGPoint(x:260, y: 460))
        path.addQuadCurve(to: CGPoint(x: 256, y: 375), controlPoint: CGPoint(x:250, y: 410))
        
        // 敘述顯示的code
        let addHandAndFeetLayer = CAShapeLayer()
        addHandAndFeetLayer.fillColor = UIColor(red: 1/255, green: 182/255, blue: 213/255, alpha: 1).cgColor
        addHandAndFeetLayer.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        addHandAndFeetLayer.lineWidth = 3
        addHandAndFeetLayer.path = path.cgPath

        return addHandAndFeetLayer
    }
   
    //BMO獨立右邊的手
    func addRightHand() -> CAShapeLayer {
        let path = UIBezierPath()
        //右邊手
        path.move(to: CGPoint(x:278, y: 295))
        path.addQuadCurve(to: CGPoint(x: 278, y: 320), controlPoint: CGPoint(x:270, y: 310))
        path.addQuadCurve(to: CGPoint(x: 375, y: 180), controlPoint: CGPoint(x:370, y: 300))
        path.addQuadCurve(to: CGPoint(x: 369, y: 190), controlPoint: CGPoint(x:372, y: 170))
        path.addQuadCurve(to: CGPoint(x: 363, y: 190), controlPoint: CGPoint(x:368, y: 160))
        path.addQuadCurve(to: CGPoint(x: 358, y: 190), controlPoint: CGPoint(x:365, y: 160))
        path.addQuadCurve(to: CGPoint(x: 278, y: 295), controlPoint: CGPoint(x:350, y: 290))
        
        
        // 敘述顯示的code
        let addRightHandLayer = CAShapeLayer()
        addRightHandLayer.fillColor = UIColor(red: 1/255, green: 182/255, blue: 213/255, alpha: 1).cgColor
        addRightHandLayer.strokeColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        addRightHandLayer.lineWidth = 3
        addRightHandLayer.path = path.cgPath

        return addRightHandLayer
    }
    
    
    
    
    
    
    //下面不要動
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        DrawView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
