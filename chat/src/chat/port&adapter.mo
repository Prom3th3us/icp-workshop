import Types "../types/Types";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import chat_1_0_0 "1.0.0";
import chat_1_0_1 "1.0.1";
import Result "mo:base/Result";


module interface {
  
  type v1_0_1 = Types.chat.canister.v1_0_1;
  type Result<T,E> = Result.Result<T, E>;

  public type port = actor {
      sendMessage: Types.Message -> async Result<(), Text>;
      //addMember: (Types.Member, Types.user.canister.v1_0_1) -> async Result<(), Text>; 
      //getMembers: query () -> async Result<[Text], Text>;
      //getMessages: query () -> async Result<[Types.Message], Text>;
      //getState: query () -> async Result<Types.chat.state.v1_0_1, Text>;
      //getVersion: query () -> async Result<Types.chat.canister.version, Text>;
  };

 // module adapters {

   // type Adapt<A> = { upgrade: A -> async port };

//    let v0_0_1: Adapt<Types.chat.canister.v0_0_1> = {
//        upgrade = func (old: Types.chat.canister.v0_0_1): async port {
//            return  {
//               sendMessage = func (a: Types.Message): async Result<(), Text>  { return #error("error");};
                //func addMember (a: Types.Member, b: Types.user.canister.v1_0_1): async Result<(), Text>  { return #error("error");}; 
                //func getMembers () : async Result<[Text], Text> { return #error("error");};
                //func getMessages  () : async Result<[Types.Message], Text> { return #error("error");};
                //func getState  () : async Result<Types.chat.state.v1_0_1, Text> { return #error("error");};
                //func getVersion  () :async Result<Types.chat.canister.version, Text> { return #error("error");};
//            };
//        };
//    };
    
//  };
  
  


  type chatVersions = Types.chat.canister.versions;
  /*public func adapt(other: userVersions, we: chatVersions): chat_user_interaction {
    return (switch ((other, we)) {
      case ((#v1_0_0 userRef), (#v1_0_0 chatRef)) user_1_0_0.chat_1_0_0.interact(userRef, chatRef);
      case ((#v1_0_0 userRef), (#v1_0_1 chatRef)) user_1_0_0.chat_1_0_1.interact(userRef, chatRef);
      case ((#v1_0_1 userRef), (#v1_0_0 chatRef)) user_1_0_1.chat_1_0_0.interact(userRef, chatRef);
      case ((#v1_0_1 userRef), (#v1_0_1 chatRef)) user_1_0_1.chat_1_0_1.interact(userRef, chatRef);
    });
  }; 
  */
   
  type failure = {
    #thisFunctionNoLongerExists;
    #thisFunctionHasNotBeenImplemented;
    #notImplemented;
  };
  type commands = {
    #proceed;
    #fail: failure;
  };

  type chat_user_interaction = {
    addMember: () -> commands;
    sendMessage: () -> commands;
  };


 /*
  type Adapt<A, B> = { interact: (A, B) -> chat_user_interaction };


  module user_1_0_0 {
      public let chat_1_0_0: Interact<user.v1_0_0, chat.v1_0_0> = {
        interact = func (other: user.v1_0_0, we: chat.v1_0_0): chat_user_interaction {
            return {
              addMember = func () { return #proceed; };
              sendMessage = func () { return #fail(#notImplemented); };
            };
        };
      };

      public let chat_1_0_1: Interact<user.v1_0_0, chat.v1_0_1> = {
        interact = func (other: user.v1_0_0, we: chat.v1_0_1): chat_user_interaction {
            return {
              addMember = func () { return #proceed; };
              sendMessage = func () { return #proceed; };
            };
        };
      };
  };


  module user_1_0_1 {
      public let chat_1_0_0: Interact<user.v1_0_1, chat.v1_0_0> = {
        interact = func (other: user.v1_0_1, we: chat.v1_0_0): chat_user_interaction {
            return {
              addMember = func () { return #proceed; };
              sendMessage = func () { return #fail(#notImplemented); };
            };
        };
      };

      public let chat_1_0_1: Interact<user.v1_0_1, chat.v1_0_1> = {
        interact = func (other: user.v1_0_1, we: chat.v1_0_1): chat_user_interaction {
            return {
              addMember = func () { return #proceed; };
              sendMessage = func () { return #proceed; };
            };
        };
      };
  };




  type userVersions = Types.user.canister.versions;
  public func interact(other: userVersions, we: chatVersions): chat_user_interaction {
    return (switch ((other, we)) {
      case ((#v1_0_0 userRef), (#v1_0_0 chatRef)) user_1_0_0.chat_1_0_0.interact(userRef, chatRef);
      case ((#v1_0_0 userRef), (#v1_0_1 chatRef)) user_1_0_0.chat_1_0_1.interact(userRef, chatRef);
      case ((#v1_0_1 userRef), (#v1_0_0 chatRef)) user_1_0_1.chat_1_0_0.interact(userRef, chatRef);
      case ((#v1_0_1 userRef), (#v1_0_1 chatRef)) user_1_0_1.chat_1_0_1.interact(userRef, chatRef);
    });
  };
    
*/



};
