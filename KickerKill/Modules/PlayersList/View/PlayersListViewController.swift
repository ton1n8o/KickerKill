// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

enum PlayerViewErrors {
    case tooManyPlayers
}

enum PlayerPosition: Int, CaseIterable {
    case firstPlayer = 1
    case secondPlayer
    case thirdPlayer
    case forthPlayer
}

final class PlayersListViewController: UIViewController, PlayersListViewInput {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var startGameButton: UIButton!

    @IBOutlet private var player1Label: UILabel!
    @IBOutlet private var player2Label: UILabel!
    @IBOutlet private var player3Label: UILabel!
    @IBOutlet private var player4Label: UILabel!

    @IBOutlet private var playerView1: UIView!
    @IBOutlet private var playerView2: UIView!
    @IBOutlet private var playerView3: UIView!
    @IBOutlet private var playerView4: UIView!

    @IBOutlet var buttonRemovePlayer1: UIButton!
    @IBOutlet private var buttonRemovePlayer2: UIButton!
    @IBOutlet private var buttonRemovePlayer3: UIButton!
    @IBOutlet private var buttonRemovePlayer4: UIButton!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private var gameTypeInputText: UITextField!
    @IBOutlet private var gameTypeSwitch: UISwitch!
    @IBOutlet weak var gameTypeLabel: UILabel!

    var output: PlayersListViewOutput!
    private var players: [Player] = []

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameTypeInputText.delegate = self
        setupKeyBoardDismissButton()
        tableView.registerByCellNib(PlayerListCell.self)

        output.viewIsReady()

        roundAndHideElements()
        subscribeToKeyboardNotifications()
    }

    private func setupKeyBoardDismissButton() {

        let width = UIScreen.main.bounds.width
        let frame = CGRect(x: 0, y: 0, width: width, height: 50)

        let doneToolbar = UIToolbar(frame: frame)
        doneToolbar.barStyle = .default

        var flexSpace: UIBarButtonItem {
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil)
        }

        var done: UIBarButtonItem {
            UIBarButtonItem(title: "Done", style: .done,
                            target: self,
                            action: #selector(doneButtonAction))
        }

        doneToolbar.items = [flexSpace, done]
        doneToolbar.sizeToFit()
        gameTypeInputText.inputAccessoryView = doneToolbar
    }

    @objc
    private func doneButtonAction() {
        gameTypeInputText.resignFirstResponder()
    }

    private func roundAndHideElements() {

        [playerView1, playerView2, playerView3, playerView4, startGameButton].forEach {
            $0.setRoundCorner()
        }

        [buttonRemovePlayer1, buttonRemovePlayer2, buttonRemovePlayer3, buttonRemovePlayer4].forEach {
            $0?.setRoundCorner()
            $0?.isHidden = true
            $0?.addTarget(self, action: #selector(removePlayer), for: .touchUpInside)
        }
    }

    private func subscribeToKeyboardNotifications() {

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        bottomConstraint.constant = getKeyboardHeight(notification)
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        bottomConstraint.constant = 0
    }

    private func getKeyboardHeight(_ notification: Notification) -> CGFloat {

        let window = UIApplication.shared.keyWindow
        let bottomPadding = window?.safeAreaInsets.bottom

        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height - (bottomPadding ?? 0)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }

    private func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func removePlayer(sender: UIButton) {
        guard let playerPosition = PlayerPosition(rawValue: sender.tag) else {
            assertionFailure("could not parse button tag into a PlayerPosition")
            return
        }
        output.removePlayer(at: playerPosition)
    }

    // MARK: PlayersListViewInput

    func showPlayers(_ players: [Player]) {
        self.players = players
        tableView.reloadData()
    }

    func updateWithDataModel(_ dataModel: PlayersListViewDataModel) {

        print("\(#function ) >>> CHAMOUUUUUUU")

        /*
         adicionar placeholder
         placeholder ( do próximo player a ser selecionado ) fica animado ( fade de cor )
         */

        //playerView2.alpha = 0.1
        //playerView3.alpha = 0.1
        //playerView4.alpha = 0.1

        animateNextPlayer(getNextPlayer())
        //animateNextPlayer(playerView1)
        //animateNextPlayer2()

        //addPulse(getNextPlayer())

        startGameButton.isEnabled = dataModel.startGameEnabled
        startGameButton.backgroundColor = dataModel.startGameEnabled ? .systemGreen : .lightGray

        player1Label.text = dataModel.team1Initials.0
        showHidePlayerUI(playerView: playerView1,
                         btnRemove: buttonRemovePlayer1,
                         hide: dataModel.team1Initials.0 == nil)

        player3Label.text = dataModel.team1Initials.1
        showHidePlayerUI(playerView: playerView3,
                         btnRemove: buttonRemovePlayer3,
                         hide: dataModel.team1Initials.1 == nil)

        player2Label.text = dataModel.team2Initials.0
        showHidePlayerUI(playerView: playerView2,
                         btnRemove: buttonRemovePlayer2,
                         hide: dataModel.team2Initials.0 == nil)

        player4Label.text = dataModel.team2Initials.1
        showHidePlayerUI(playerView: playerView4,
                         btnRemove: buttonRemovePlayer4,
                         hide: dataModel.team2Initials.1 == nil)

        if let gameType = dataModel.gameType {
            updateGameType(gameType)
        }
    }

    private func getNextPlayer() -> UIView {

        let nextPlayer: PlayerPosition = output.getNextPlayer()
        print("\(#function ) >>> PlayerPosition: \(nextPlayer)")

        switch nextPlayer {
        case .firstPlayer:
            return playerView1
        case .secondPlayer:
            return playerView2
        case .thirdPlayer:
            return playerView3
        case .forthPlayer:
            return playerView4
        }
    }

    private func animateNextPlayer(_ player: UIView) {
        let durationOfAnimation: Double = 1.5
        let delayOfAnimation: Double = 0
        let inicialTransparency: CGFloat = 0.3
        let finalTransparency: CGFloat = 1

        UIView.animate(withDuration: durationOfAnimation, delay: delayOfAnimation, options: [.autoreverse, .repeat]) {
            player.alpha = inicialTransparency
        } completion: { finish in
            player.alpha = finalTransparency

            print("\(#function ) >>> finish: \(finish)")
        }
    }

/* it does not working...
    private func animateNextPlayer2() {
        let durationOfAnimation: Double = 1.5
        let delayOfAnimation: Double = 0
        let inicialTransparency: CGFloat = 0.3
        let finalTransparency: CGFloat = 1
        let nextPlayer: PlayerPosition = output.getNextPlayer()
        print("\(#function ) >>> PlayerPosition: \(nextPlayer)")

        switch nextPlayer {
        case .firstPlayer:
            UIView.animate(withDuration: durationOfAnimation, delay: delayOfAnimation, options: [.autoreverse, .repeat]) {
                self.playerView1.alpha = inicialTransparency
            } completion: { finish in
                self.playerView1.alpha = finalTransparency
                print("\(#function ) >>> finish: \(finish)")
            }
        case .secondPlayer:
            UIView.animate(withDuration: durationOfAnimation, delay: delayOfAnimation, options: [.autoreverse, .repeat]) {
                self.playerView2.alpha = inicialTransparency
            } completion: { finish in
                self.playerView2.alpha = finalTransparency
                print("\(#function ) >>> finish: \(finish)")
            }
        case .thirdPlayer:
            UIView.animate(withDuration: durationOfAnimation, delay: delayOfAnimation, options: [.autoreverse, .repeat]) {
                self.playerView3.alpha = inicialTransparency
            } completion: { finish in
                self.playerView3.alpha = finalTransparency
                print("\(#function ) >>> finish: \(finish)")
            }
        case .forthPlayer:
            UIView.animate(withDuration: durationOfAnimation, delay: delayOfAnimation, options: [.autoreverse, .repeat]) {
                self.playerView4.alpha = inicialTransparency
            } completion: { finish in
                self.playerView4.alpha = finalTransparency
                print("\(#function ) >>> finish: \(finish)")
            }
        }
    }
*/

/* it does not working...
    func addPulse(_ player: UIView) {
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: player.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor

        player.layer.insertSublayer(pulse, below: player.layer)
    }
*/

    private func showHidePlayerUI(playerView: UIView, btnRemove: UIButton, hide: Bool) {
//        playerView.isHidden = hide
        btnRemove.isHidden = hide
    }

    func showError(error: PlayerViewErrors) {
        // podemos mudar a cor da tableView e desabilitala: tooManyPlayers
    }

    func updateGameType(_ gameType: GameType) {

        let value: String
        let timeBased: Bool

        switch gameType {
        case .goalBased(let goals):
            value = "\(goals)"
            timeBased = false

        case .timeBased(let minutes):
            value = "\(minutes)"
            timeBased = true
        }

        gameTypeSwitch.setOn(timeBased, animated: true)
        updateGameTypeSwitch(gameTypeSwitch)
        gameTypeInputText.text = value
    }

    // MARK: - Actions

    private func updateGameTypeSwitch(_ sender: UISwitch) {
        gameTypeLabel.text = "Time based"
        if !sender.isOn {
            gameTypeLabel.text = "Goal based"
        }
    }

    @IBAction func didChangeGameType(_ sender: UISwitch) {
        updateGameTypeSwitch(sender)
        let gameType = gameTypeWith(gameTypeInputText)
        output.didSelectGameType(gameType)
    }

    private func gameTypeWith(_ textField: UITextField) -> GameType? {

        guard let textValue = textField.text, let value = Int(textValue) else {
            return nil
        }

        return gameTypeSwitch.isOn ?
            .timeBased(minutes: value) : .goalBased(totalGoals: value)
    }

    @IBAction func startGame(sender: UIButton) {
        output.startGame()
    }
}

// MARK: - UITableViewDataSource

extension PlayersListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(PlayerListCell.self, for: indexPath)
        cell.config(players[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlayersListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectPlayer(players[indexPath.row])
    }
}

// MARK: - UITextFieldDelegate

extension PlayersListViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        output.didSelectGameType(gameTypeWith(textField))
    }
}
