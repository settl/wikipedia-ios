
class WMFWelcomeAnimationBackgroundViewController: UIViewController {
    var welcomePageType:WMFWelcomePageType = .intro
    fileprivate var hasAlreadyAnimated = false
    
    fileprivate lazy var animationView: WMFWelcomeAnimationView = {
        switch welcomePageType {
        case .intro:
            let view = WMFWelcomeIntroductionAnimationBackgroundView()
            view.backgroundColor = .red
            return view
        case .exploration:
            let view = WMFWelcomeExplorationAnimationBackgroundView()
            view.backgroundColor = .green
            return view
        case .languages:
            let view = WMFWelcomeLanguagesAnimationBackgroundView()
            view.backgroundColor = .blue
            return view
        case .analytics:
            let view = WMFWelcomeAnalyticsAnimationBackgroundView()
            view.backgroundColor = .yellow
            return view
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.wmf_addSubviewWithConstraintsToEdges(animationView)
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        view.superview?.layoutIfNeeded() // Fix for: http://stackoverflow.com/a/39614714
        animationView.addAnimationElementsScaledToCurrentFrameSize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (!hasAlreadyAnimated) {
            animationView.beginAnimations()
        }
        hasAlreadyAnimated = true
    }
}
