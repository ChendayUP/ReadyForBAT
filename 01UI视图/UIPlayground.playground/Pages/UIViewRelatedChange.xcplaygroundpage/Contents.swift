//: [Previous](@previous)

class myView: UIView {
    init() {
        super.init()
        print("\(__func__)")
    }
    //通过代码创建控件就会调用这个方法
    init(frame: CGRect) {
        super.init(frame: frame)
        print("\(__func__)")
    }
    //通过storyboared或者xib中创建控件就会调用这个方法
    init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("\(__func__)")
    }
    func awakeFromNib() {
        super.awakeFromNib()
        print("\(__func__)")
    }
    //如果在initWithFrame中添加子视图会调用两次
    func layoutSubviews() {
        super.layoutSubviews()
        print("\(__func__)")
    }
    func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        print("\(__func__)")
    }
    func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        print("\(__func__)")
    }
    func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("\(__func__)")
    }
    func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("\(__func__)")
    }
    func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        print("\(__func__)")
    }
    func didMoveToWindow() {
        super.didMoveToWindow()
        print("\(__func__)")
    }
    func removeFromSuperview() {
        super.removeFromSuperview()
        print("\(__func__)")
    }
    deinit {
        print("\(__func__)")
    }
}



//: [Next](@next)
