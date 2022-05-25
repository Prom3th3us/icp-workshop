import Types "../types/Types";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";



actor class User(
  initialState: Types.user.state.v1_0_0
) {

  type State = Types.user.state.v1_0_0;
  stable var state: State = initialState;



  public func empty() : async () {
    state := {
      name = state.name;
      chats = [];
    }
  };

  public func receiveMessage(message: Types.Message): async () { // member interface
      Debug.print("[User][receiveMessage]: message.from: " # message.from.name);
      Debug.print("[User][receiveMessage]: message.content: " # message.content);
  };
  

  public func addChat(chat: Types.Chat): async () { // member interface
      Debug.print("[User][addChatRef]: " # state.name);
      state := state;
      return ();
  };


  public shared query func getVersion() : async Text {
    return "user-1.0.0"
  };


  public shared query func getChats() : async [Types.Chat] {
    return state.chats;
  };

  public shared query func getState() : async State {
    return state;
  };


};
