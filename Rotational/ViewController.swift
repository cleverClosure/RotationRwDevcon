/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var firstConstraints: [NSLayoutConstraint]!
  
  @IBOutlet var secondConstraints: [NSLayoutConstraint]!
  
  var rotateCounter: Int = 0

  @IBAction private func rotate() {
    
    switch rotateCounter {
    case 0, 2:
      toggleConstraints(firstConstraints)
    case 1, 3:
      toggleConstraints(secondConstraints)
    default:
      break
    }
    incrementRotateCounter()
    UIView.animate(withDuration: 0.8, animations: view.layoutIfNeeded)
  }
  
  func incrementRotateCounter() {
    rotateCounter += 1
    rotateCounter = rotateCounter > 3 ? 0 : rotateCounter
  }
  
  fileprivate func toggleConstraints(_ constraints: [NSLayoutConstraint]) {
    constraints.forEach {
      $0.isActive = !$0.isActive
    }
  }
  
}
