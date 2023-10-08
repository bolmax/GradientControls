

import UIKit

@IBDesignable
open class GradientView: UIView {
    
    @IBInspectable public var startColor: UIColor = .white {
        didSet { updateLayer() }
    }

    @IBInspectable public var endColor: UIColor = .black {
        didSet { updateLayer() }
    }

    @IBInspectable public var startPoint: CGPoint {
        get { gradientLayer.startPoint }
        set { gradientLayer.startPoint = newValue }
    }

    @IBInspectable public var endPoint: CGPoint {
        get { gradientLayer.endPoint }
        set { gradientLayer.endPoint = newValue }
    }

    @IBInspectable public var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }

    @IBInspectable public var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable public var borderColor: UIColor? {
        get { layer.borderColor.flatMap { UIColor(cgColor: $0) } }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable public var shadowColor: UIColor? {
        get { layer.shadowColor.flatMap { UIColor(cgColor: $0) }}
        set {
            layer.shadowColor = newValue?.cgColor
            updateShadow()
        }
    }
    
    public var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet { updateShadow() }
    }
    
    public var shadowOpacity: Float = 1 {
        didSet { updateShadow() }
    }
    
    public var shadowRadius: CGFloat = 0 {
        didSet { updateShadow() }
    }
    
    public override class var layerClass: AnyClass { CAGradientLayer.self }
    private var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        updateLayer()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLayer()
    }
}

private extension GradientView {
    func updateLayer() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    func updateShadow() {
        gradientLayer.shadowOffset = shadowOffset
        gradientLayer.shadowRadius = shadowRadius
        gradientLayer.shadowOpacity = shadowOpacity
    }
}
