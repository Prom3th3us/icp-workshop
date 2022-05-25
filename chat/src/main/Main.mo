


import Types "../types/Types";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import List "mo:base/List";
import Text "mo:base/Text";
import TrieMap "mo:base/TrieMap";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import ActorRepository "../common/ActorRepository";
import Option "mo:base/Option";

import user_1_0_0 "../user/1.0.0";
import user_1_0_1 "../user/1.0.1";
import UserVersion "../user/versioning";
import chat_0_0_1 "../chat/0.0.1/actor";
import chat_1_0_0 "../chat/1.0.0";
import chat_1_0_1 "../chat/1.0.1";
import ChatVersion "../chat/versioning";
import ChatInteractor "../chat/port&adapter";


actor Main {
 type User = Types.user.canister.versions;
 type Chat = Types.chat.canister.versions;
 
 let ActorRepositoryModule = ActorRepository;

 let users = ActorRepositoryModule.empty<User>();
 let chats = ActorRepositoryModule.empty<Chat>();

  // User.createUser
  public func createUser(name: Text): async User {
    let ref = await user_1_0_0.User{
      name = name;
      chats = [];
    };
    let principal = Principal.fromActor(ref); 
    Debug.print("[Main][createUser]: memberPrincipal: " # Principal.toText(principal));
    return users.create(name, (principal, #v1_0_0(ref)));
  };  
  
  // User.upgrade 
  public func upgradeUser(name: Text): async User {
    Debug.print("[Main][upgradeUser]: " );
    return (switch (users.find(name)) {
      case null (await createUser(name));
      case (?userRef) {
        return switch userRef {
          case (#v1_0_0 userRef) #v1_0_1((await UserVersion.upgrade(userRef)));
          case (#v1_0_1 e) #v1_0_1 e;
        };
      };
    });
  };

  // User.addChat
  public func addChat(name: Text, chat: Types.Chat): async () {
    Debug.print("[Main][addChat]: " );
    switch (users.find(name)) {
      case null ();
      case (?userRef) (); // FIX await userRef.addChat(chat);
    };
  };

  // User.getChats
  public func getChats(name: Text): async [Types.Chat] {
    Debug.print("[Main][getChats]: " );
    return (switch (users.find(name)) {
      case null [];
      case (?userRef) []; // FIX await userRef.getChats();
    });
  };


  // User.userExists
  public func userExists(name: Text): async Bool {
    Debug.print("[Main][getChats]: " );
    return (switch (users.find(name)) {
      case null false;
      case (?userRef) true; // FIX await userRef.getChats();
    });
  };

  // Chat.addMember
  public func addMember(chat: Text, user: Text): async () {
    Debug.print("[Main][addMember]: " );
    switch (chats.find(chat)) {
      case null ();
      case (?chatRef) {
        switch (users.find(user)) {
          case null ();
          case (?userRef) {
            /*let a = ChatInteractor.interact(
              userRef, 
              chatRef
              ).addMember(); TODO  */
              return ();
          };
        
        };
      };
    };
  };

  // Chat.sendMessage
  public func sendMessage(chat: Text, message: Types.Message): async () {
    Debug.print("[Main][sendMessage]: " );
    switch (chats.find(chat)) {
      case null ();
      case (?chatRef) {
        
        // TODO let a = await chatRef.sendMessage(message);
        return (); // TODO
      };
    };
  };


  // Chat.getMessages
  public func getMessages(chat: Text): async [Types.Message] {
    Debug.print("[Main][getMessages]: " );
    return (switch (chats.find(chat)) {
      case null [];
      case (?chatRef) {
        [] // TODO await chatRef.getMessages();
      };
    });
  };

    // Chat.getMembers
  public func getMembers(chat: Text): async [Text] {
    Debug.print("[Main][getMembers]: " );
    return (switch (chats.find(chat)) {
      case null [];
      case (?chatRef) {
        [] // TODO await chatRef.getMembers();
      };
    });
  };


};
