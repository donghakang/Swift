import UIKit
import Social

class ViewController: UIViewController {
    
    @IBAction func tapShareBtn() {
        let shareText = "글을 써본다"
        let shareItems = [shareText]
        let exclusion  = [UIActivity.ActivityType.print,
                          UIActivity.ActivityType.addToReadingList]
        
        let avc = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        avc.excludedActivityTypes = exclusion
        
        present(avc, animated: true, completion: nil)
    }
}
