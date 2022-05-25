import Types "../types/Types";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";



actor class User(
  initialState: Types.user.state.v1_0_1
) {
  
  type State = Types.user.state.v1_0_1;
  stable var state: State = initialState;



  public func empty() : async () {
    state := {
      name = state.name;
      special = "empty";
      chats = [];
    }
  };

  public func receiveMessage(message: Types.Message): async () { // member interface
      Debug.print("[User][receiveMessage]: message.from: " # message.from.name);
      Debug.print("[User][receiveMessage]: message.content: " # message.content);
  };
  
  public func newSpecialFunction(): async () {
          Debug.print("[User][newSpecialFunction]: " # state.name);
  };

  public func addChat(chat: Types.Chat): async () { // member interface
      Debug.print("[User][addChatRef]: " # state.name);
      state := state;
      return ();
  };


  public shared query func getVersion() : async Text {
    return "user-1.0.1"
  };


  public shared query func getChats() : async [Types.Chat] {
    return state.chats;
  };

  public shared query func getState() : async State {
    return state;
  };


};
