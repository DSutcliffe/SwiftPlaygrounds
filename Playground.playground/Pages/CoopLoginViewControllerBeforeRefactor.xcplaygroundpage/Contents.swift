//
//  CoopLoginViewController.swift
//  CoopAuthentication
//
//  Created by Rajesh on 16/02/21.
//

/// I made changes to viewDidLoad - might affect spinner etc. Keeping original incase requires changing back!!!

import UIKit
import CoopComponents
import CoopCore
import i18
import CoopAnalytics
import CoopUI

class CoopLoginViewController: CoopViewController, AlertPresentable {
    private var viewModel: CoopLoginViewModelProtocol
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var spinnerView: UIView!
    @IBOutlet private weak var spinnerImageView: UIImageView!
    @IBOutlet private weak var spinnerLabelView: UILabel!
    
    let analyticsDataModel: AnalyticsDataModelProtocol
  
    init(viewModel: CoopLoginViewModelProtocol, analyticsDataModel: AnalyticsDataModelProtocol) {
        self.viewModel = viewModel
        self.analyticsDataModel = analyticsDataModel
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundImageView.image = viewModel.backgroundIcon
        setupSecureConnectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if AppConfiguration.appThemeType == ThemeType.coop {
            backgroundImageView.backgroundColor = Color.brandDark
        } else {
            backgroundImageView.backgroundColor = Color.darkerColor
        }
        
        backgroundImageView.image = viewModel.backgroundIcon
        spinnerView.backgroundColor = UIColor.init(white: 0, alpha: 0)
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.addNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        super.viewWillDisappear(animated)
        self.removeNotification()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

    fileprivate func configureUI() {
        setupUI()
        setupSpinnerView()
        viewModel.establishConnection()
        showSpinnerView(hidden: true)
        viewModel.showHideSpinner = { [weak self] (hidden: Bool) in
            DispatchQueue.main.async {
                self?.showSpinnerView(hidden: hidden)
            }
        }

        viewModel.showLoadingTextSpinner = { [weak self] () in
            DispatchQueue.main.async {
                self?.setupLoggingInView()
            }
        }

        viewModel.showErrorAlert = { [weak self] (title, message, dismissTitle) in
            guard let self = self else { return }
            
            let action = UIAlertAction(title: dismissTitle, style: .cancel) { [weak self] (_) in
                    self?.viewModel.handleLoginFailureAction()
            }
            
            if title == I18.logoutErrorDialogReturnToLogin.string() {
                LoginGenericErrorPopupAnalyticsDataModel(pageAnalyticsData: self.analyticsDataModel.analyticsData, viewedElementDetails: message, errorType: .nonRecoverable).send()
            } else {
                LoginGenericErrorPopupAnalyticsDataModel(pageAnalyticsData: self.analyticsDataModel.analyticsData, viewedElementDetails: message, errorType: .recoverable).send()
            }
            
            self.showDefaultAlert(withTitle: title, message: message, actions: [action])
        }
    }
    
    func addNotification() {
        self.removeNotification()
        NotificationCenter.default.addObserver(self, selector: #selector(self.startImageViewAnimation), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func removeNotification() {
        NotificationCenter.default.removeObserver(UIApplication.willEnterForegroundNotification)
    }
}

extension CoopLoginViewController {
    private func setupSpinnerView() {
        spinnerView.layer.cornerRadius = 10
        spinnerImageView.image = ThemeImage.spinner
    }
    
    private func setupSecureConnectionView() {
        spinnerLabelView.attributedText = viewModel.establishConnectionText.coopStyleAttributedString(lineHeight: 1.18, color: Color.textLight, font: Fonts.shared.font(forTextStyle: .subheadline), textAlignment: .center)
    }
    
    private func setupLoggingInView() {
        spinnerLabelView.attributedText = viewModel.loggingInText.coopStyleAttributedString(lineHeight: 1.18, color: Color.textLight, font: Fonts.shared.font(forTextStyle: .subheadline), textAlignment: .center)
        showSpinnerView(hidden: false)
    }
    
    private func showSpinnerView(hidden: Bool) {
        if hidden {
            spinnerView.isHidden = true
            stopImageViewAnimation()
        } else {
            spinnerView.isHidden = false
            startImageViewAnimation()
        }
    }
    
    private func stopImageViewAnimation() {
        spinnerImageView.layer.removeAllAnimations()
    }
    
    @objc private func startImageViewAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi * 2.0
        rotateAnimation.duration = 1.0
        rotateAnimation.repeatCount = .greatestFiniteMagnitude
        DispatchQueue.main.async {
            self.spinnerImageView.layer.add(rotateAnimation, forKey: nil)
        }
        
    }
}
