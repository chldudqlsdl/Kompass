//
//  Canvas.swift
//  Orum
//
//  Created by Youngbin Choi on 11/10/23.
//

import Foundation
import SwiftUI
import CoreMotion
import PencilKit

struct Canvas: UIViewControllerRepresentable {
    
    @Binding var writingCount : Int
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let fallingViewController = FallingViewController(writingCount: $writingCount)
        return fallingViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

class FallingViewController : UIViewController, UITextFieldDelegate, PKCanvasViewDelegate, UICollisionBehaviorDelegate {
    
    @Binding var writingCount: Int

    var gravity : UIGravityBehavior!
    var collision: UICollisionBehavior!
    var animator: UIDynamicAnimator!
    var motion =  CMMotionManager()
    var queue: OperationQueue!
    
    var canvasItems : [UIImageView] = []
    var canvas : PKCanvasView!
    
    lazy var posX: CGFloat = (self.view.bounds.width - width) * 0.5
    lazy var posY: CGFloat = (self.view.bounds.height - height) * 0.25
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var guideImageView : UIImageView!
    let guideImage = UIImage(named: "ㅏdrawing")!
    var writedImageView : UIImageView!
    
    let PKInkTools : [PKInkingTool.InkType] = [.pen, .pencil, .crayon, .marker, .monoline, .watercolor, .fountainPen]
    let Colors : [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemMint, .systemCyan, .systemBlue, .systemIndigo, .systemPurple, .systemPink, .systemBrown, .systemGray, .systemTeal, .magenta, .black]
    
    
    init(writingCount: Binding<Int>) {
            self._writingCount = writingCount
            super.init(nibName: nil, bundle: nil)
        }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = guideImage.size.width / 6
        height = guideImage.size.height / 6
        guideImageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))
        guideImageView.image = guideImage
        writedImageView = UIImageView()
        
        
        queue = OperationQueue.current
        animator = UIDynamicAnimator(referenceView: self.view)
        
        canvas = PKCanvasView()
        canvas.backgroundColor = .clear
//        canvas.frame = CGRect(x: posX, y: posY, width: width, height: height)
        canvas.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        canvas.drawingPolicy = .anyInput
        canvas.tool = PKInkingTool(PKInkTools[Int.random(in: 0 ..< PKInkTools.count)], color: Colors[Int.random(in: 0 ..< Colors.count)], width: 5)
        canvas.delegate = self
        
        view.addSubview(guideImageView)
        view.addSubview(canvas)
        view.addSubview(writedImageView)
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        
        let stroke = canvasView.drawing.strokes.count
//        print(stroke)
        
        if stroke == 2 {
            writingCount += 1
            TTSManager.shared.play("아")
            
            let writedImage = canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 1.0)
            
            writedImageView.frame = CGRect(x: CGFloat.random(in: 0 ..< self.view.bounds.width - width * 0.5), y: 1, width: writedImage.size.width * 0.7, height: writedImage.size.height * 0.7)
            writedImageView.image = writedImage
            
//            writedImageView.frame = CGRect(x: CGFloat.random(in: 0 ..< self.view.bounds.width - width * 0.5), y: 1, width: width * 0.7, height: height * 0.7)
//            writedImageView.image = canvasView.drawing.image(from: canvasView.bounds, scale: 1.0)

            
            canvasView.drawing = PKDrawing()
            
            canvasItems.append(writedImageView)
            gravity = UIGravityBehavior(items: canvasItems)
            gravity.magnitude = 1.0
            collision = UICollisionBehavior(items: canvasItems)
            collision.addBoundary(withIdentifier: "borders" as NSCopying, for: UIBezierPath(rect: self.view.frame))
            collision.collisionDelegate = self
            
            animator.addBehavior(gravity)
            animator.addBehavior(collision)
            
            motion.startDeviceMotionUpdates(to: queue) { motion, error in
                guard let motion = motion else { return }
                
                let grav: CMAcceleration = motion.gravity
                let x = CGFloat(grav.x)
                let y = CGFloat(grav.y)
                var p = CGPoint(x: x, y: y)
                
                if let orientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation {
                    if orientation == .landscapeLeft {
                        let t = p.x
                        p.x = 0 - p.y
                        p.y = t
                    } else if orientation == .landscapeRight {
                        let t = p.x
                        p.x = p.y
                        p.y = 0 - t
                    } else if orientation == .portraitUpsideDown {
                        p.x *= -1
                        p.y *= -1
                    }
                }
                
                let v = CGVector(dx: p.x, dy: 0 - p.y)
                self.gravity.gravityDirection = v
            }
            
            canvas.tool = PKInkingTool(PKInkTools[Int.random(in: 0 ..< PKInkTools.count)], color: Colors[Int.random(in: 0 ..< Colors.count)], width: 7)
            
            writedImageView = UIImageView()
            
            view.addSubview(canvas)
            view.addSubview(writedImageView)
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        HapticManager.shared.hapticImpact(style: .soft)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        for imageView in canvasItems {
            imageView.removeFromSuperview()
        }
        canvasItems.removeAll()
        animator.removeBehavior(gravity)
        animator.removeBehavior(collision)
        HapticManager.shared.hapticNotification(type: .warning)
    }

}

#Preview(body: {
    Canvas(writingCount: .constant(0))
})
