import UIKit

extension UIView {
    func bounceOut(duration: CGFloat) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        }
    }
}

extension Int {
    func times(closure: () -> Void) {
        guard self > 0 else { return }
        
        for _ in 1...self {
            closure()
        }
    }
}

extension Array where Element: Comparable {
    mutating func remove(item: Element) {
        var counter = 0
        for element in self {
            if element == item {
                counter += 1
            }
        }
        if counter > 1 {
            if let index = self.firstIndex(of: item) {
                self.remove(at: index)
            }
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testView = UIView()
        testView.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        testView.backgroundColor = .red
        view.addSubview(testView)
        testView.bounceOut(duration: 10)
        
        var counter = 0
        let num = 1
        num.times {
            counter += 1
        }
        print(num == counter)
        
        var arr1 = [1, 2, 3, 2, 1]
        arr1.remove(item: 2)
        print(arr1)
        
        var arr2 = ["jm", "ok", "hex", "jm", "qq"]
        arr2.remove(item: "jm")
        print(arr2)
    }


}

