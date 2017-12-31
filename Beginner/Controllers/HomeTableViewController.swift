//
//  HomeTableViewController.swift
//  Beginner
//
//  Created by David Oliver Doswell on 12/31/17.
//  Copyright © 2017 David Oliver Doswell. All rights reserved.
//

import UIKit
import SafariServices

private let navigationTitle = "Home"
private let reuseIdentifier = "resuseIdentifier"
private let appColor = UIColor(red:0.95, green:0.79, blue:0.30, alpha:1.0)

class HomeTableViewController: UITableViewController {
    
    let sections = SectionStrings().sections
    
    var array = ArrayStrings().array
    
    let detailArray = DetailArrayStrings().detailArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(HomeCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        // Customize nav bar items
        let left = UIButton(type: .custom)
        left.setImage(UIImage(named: "Settings"), for: .normal)
        left.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        left.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        left.layer.cornerRadius = 15.0
        left.layer.masksToBounds = true
        left.contentMode = .scaleAspectFill
        left.addTarget(self, action: #selector(leftBarButtonTap(sender:)), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: left)
        
        navigationController?.hidesBarsOnTap = false
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Hide scroll indicator
        tableView.showsVerticalScrollIndicator = false
    }
    
    // Present the settings
    @objc func leftBarButtonTap(sender: UIButton) {
        let destination = BitcoinViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    // Switch on tableview sections and indexes to access resources
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0,0:
                showBitcoinWhitepaper(0,0)
            default : break
            }
        case 1:
            switch indexPath.row {
            case 0,0:
                showBitcoinCore(0,0)
            case 0,1:
                showBitcoinLectures(0,1)
            case 0,2:
                showBlockchain101(0,2)
            case 0,3:
                showLoppDotNet(0,3)
            case 0,4:
                showJimmySong(0,4)
            case 0,5:
                showTheCompleteSatoshi(0,5)
            default : break
            }
        case 2:
            switch indexPath.row {
            case 0,0:
                showDigitalGold(0,0)
            case 1,1:
                showMasteringBitcoin(1,1)
            case 1,2:
                showTheAgeOfCryptocurrency(1,2)
            case 1,3:
                showTheBitcoinStandard(1,3)
            case 1,4:
                showTheInternetOfMoney(1,4)
            default : break
            }
        case 3:
            switch indexPath.row {
            case 0,0:
                showDigitalBitbox(0,0)
            case 1,1:
                showKeepKey(1,1)
            case 1,2:
                showLedgerNanoS(1,2)
            case 1,3:
                showOpenDime(1,3)
            case 1,4:
                showTrezor(1,4)
            default : break
            }
        case 4:
            switch indexPath.row {
            case 0,0:
                showBalticHoneyBadger(0,0)
            case 1,1:
                showBreakingBitcoin(1,1)
            case 1,2:
                showHackerCongress(1,2)
            case 1,3:
                showScalingBitcoin(1,3)
            default : break
            }
        case 5:
            switch indexPath.row {
            case 0,0:
                showBitcoinDeveloperGuide(0,0)
            case 1,1:
                showBitcoinDeveloperMailingList(1,1)
            case 1,2:
                showBitcoinImprovementProposal(1,2)
            case 1,3:
                showBitcoinTechTalk(1,3)
            case 1,4:
                showHackerResidency(1,4)
            case 1,5:
                showProgrammingBlockchain(1,5)
            default : break
            }
        case 6:
            switch indexPath.row {
            case 0,0:
                showBisq(0,0)
            case 1,1:
                showBitStamp(1,1)
            case 1,2:
                showBittrex(1,2)
            case 1,3:
                showLocalBitcoins(1,3)
            case 1,4:
                showSquareCash(1,4)
            default : break
            }
        case 7:
            switch indexPath.row {
            case 0,0:
                showBitcoinCore(0,0)
            case 1,1:
                showBreadWallet(1,1)
            case 1,2:
                showGreenAddressWallet(1,2)
            case 1,3:
                showMyceliumWallet(1,3)
            default : break
            }
        case 8:
            switch indexPath.row {
            case 0,0:
                showHashPower(0,0)
            case 1,1:
                showNoded(1,1)
            case 1,2:
                showTheBitcoinPodcast(1,2)
            case 1,3:
                showUnchained(1,3)
            default : break
            }
        case 9:
            switch indexPath.row {
            case 0,0:
                showBitseed(0,0)
            case 1,1:
                showBlockstreamSatellite(1,1)
            case 1,2:
                showHalongMining(1,2)
            case 1,3:
                showLightningLabs(1,3)
            case 1,4:
                showOpenBazaar(1,4)
            default : break
            }
        case 10:
            switch indexPath.row {
            case 0,0:
                showCoinCenter(0,0)
            default : break
            }
        case 11:
            switch indexPath.row {
            case 0,0:
                showAndreasAntonopolous(0,0)
            case 1,1:
                showOffChain(1,1)
            case 1,2:
                showTheBitcoinNewsShow(1,2)
            default : break
            }
        default : break
        }
    }
    
    // Dismiss safari view with default `Done` nav bar item
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // Resources tableview
    // Section 1
    func showBitcoinWhitepaper(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bitcoin.org/bitcoin.pdf") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 2
    func showBitcoinCore(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bitcoin.org") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBitcoinLectures(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "http://bitcoinbook.cs.princeton.edu") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBlockchain101(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.youtube.com/watch?v=_160oMzblY8") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showLoppDotNet(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "http://lopp.net/bitcoin.html") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showJimmySong(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.youtube.com/watch?v=LYjUOFc0OMo") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showTheCompleteSatoshi(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "http://satoshi.nakamotoinstitute.org") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 3
    func showDigitalGold(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.goodreads.com/book/show/23546676-digital-gold") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showMasteringBitcoin(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.amazon.com/Mastering-Bitcoin-Unlocking-Digital-Cryptocurrencies/dp/1449374042") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showTheAgeOfCryptocurrency(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.amazon.com/Age-Cryptocurrency-Blockchain-Challenging-Economic/dp/1250081556/ref=pd_sim_14_1?_encoding=UTF8&psc=1&refRID=1VHVXJ7FXM9ME8C8E3VB") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showTheBitcoinStandard(_ section: Int, _ indexPath: Int) {
        if let url = URL(string:"https://www.amazon.com/Bitcoin-Standard-Decentralized-Alternative-Central/dp/1119473861/ref=sr_1_cc_1?s=aps&ie=UTF8&qid=1511575870&sr=1-1-catcorr&keywords=the+bitcoin+standard") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showTheInternetOfMoney(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.amazon.com/Internet-Money-Two-Andreas-Antonopoulos-ebook/dp/B075VB7LVG/ref=sr_1_1?ie=UTF8&qid=1511575831&sr=8-1&keywords=the+internet+of+money+volume+2") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 4
    func showDigitalBitbox(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://digitalbitbox.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showKeepKey(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.keepkey.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showLedgerNanoS(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.ledgerwallet.com/products/ledger-nano-s") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showOpenDime(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://opendime.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showTrezor(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://trezor.io") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 5
    func showBalticHoneyBadger(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.youtube.com/watch?v=DHc81OL_hk4") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBreakingBitcoin(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.youtube.com/channel/UCCP7NPTxVrt01-FlSiWYSzQ/videos") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showHackerCongress(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://liberate.hcpp.cz") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showScalingBitcoin(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.youtube.com/channel/UCmwaDulmQtX-H8FOSQTKqMg") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 6
    func showBitcoinDeveloperGuide(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bitcoin.org/en/developer-guide#block-chain") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBitcoinDeveloperMailingList(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://lists.linuxfoundation.org/mailman/listinfo/bitcoin-dev") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBitcoinImprovementProposal(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://github.com/bitcoin/bips") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBitcoinTechTalk(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bitcointechtalk.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showHackerResidency(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "http://hackerresidency.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showProgrammingBlockchain(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "http://programmingblockchain.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 7
    func showBitcoinCoreWallet(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bitcoin.org/en/wallets/desktop/mac/bitcoincore/") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBreadWallet(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://itunes.apple.com/us/app/bread-bitcoin-wallet/id885251393?mt=8") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showGreenAddressWallet(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://itunes.apple.com/us/app/greenaddress-bitcoin-wallet/id1206035886?mt=8") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showMyceliumWallet(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://itunes.apple.com/us/app/mycelium-bitcoin-wallet/id943912290?mt=8") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 8
    func showBisq(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bisq.network") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBitStamp(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.bitstamp.net") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBittrex(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bittrex.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showLocalBitcoins(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://localbitcoins.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showSquareCash(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://itunes.apple.com/us/app/cash-app/id711923939?mt=8") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 9
    func showHashPower(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "http://investorfieldguide.com/hashpower/") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showNoded(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://soundcloud.com/noded-bitcoin-podcast") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showTheBitcoinPodcast(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://itunes.apple.com/us/podcast/the-bitcoin-podcast-network/id1000457699?mt=2") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showUnchained(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://itunes.apple.com/us/podcast/unchained-big-ideas-from-worlds-blockchain-cryptocurrency/id1123922160?mt=2") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 10
    func showBitseed(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://bitseed.org") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showBlockstreamSatellite(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://blockstream.com/satellite/") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showHalongMining(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://halongmining.com") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showLightningLabs(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://lightning.engineering/index.html#home") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showOpenBazaar(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.openbazaar.org") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 11
    func showCoinCenter(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://coincenter.org") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Section 12
    func showAndreasAntonopolous(_ section: Int, _ indexPath: Int) {
        if let url = URL(string:"https://www.youtube.com/user/aantonop/videos") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showOffChain(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.youtube.com/channel/UCEFJVYNiPp8xeIUyfaPCPQw/videos") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    func showTheBitcoinNewsShow(_ section: Int, _ indexPath: Int) {
        if let url = URL(string: "https://www.youtube.com/playlist?list=PLPj3KCksGbSYHFmduDw4fyKe8H5fEZ6Be") {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // Table view
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  sections == sections {
            return array[section].count
        }
        return detailArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HomeCell
        
        let name = array[indexPath.section][indexPath.row]
        cell.textLabel?.text = name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = .black
        
        let detailName = detailArray[indexPath.section][indexPath.row]
        cell.detailTextLabel?.text = detailName
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = .black
        
        return cell
    }
}
