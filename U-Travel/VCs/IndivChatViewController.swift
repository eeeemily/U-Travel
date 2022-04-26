//
//  IndivChatViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/24/22.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender: SenderType {
    var photoURL: String
    var senderId: String
    var displayName: String
}

class IndivChatViewController: MessagesViewController {
    
    public let otherUserEmail: String
    public var isNewConversation = false
    
    @IBAction func goHome(_ sender: Any) {
        self.performSegue(withIdentifier: "go_home_gc", sender: self)
    }
    
    @IBAction func toMenu(_ sender: Any) {
    }
    
    private var messages = [Message]()
    private let selfSender = Sender(photoURL: "", senderId: "1", displayName: "Joe Smith")
    
    init(with email: String) {
        self.otherUserEmail = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        messageInputBar.inputTextView.becomeFirstResponder()
    }
}

extension IndivChatViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        guard !text.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        
        print("Sending: \(text)")
        
        //send message
        if isNewConversation {
            //create convo in database
        } else {
            //append to existing conversation data
        }
    }
}

extension IndivChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return selfSender
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}
