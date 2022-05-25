import Types "../types/Types";
import Array "mo:base/Array";
import TrieMap "mo:base/TrieMap";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Text "mo:base/Text";

actor class Chat(
  initialState: Types.chat.state.v1_0_1
) {

  type State = Types.chat.state.v1_0_1;
  type Member = Types.Member;
  type ChatVersion = Types.chat.canister.version;
  
  stable var state: State = initialState;

  type TrieMap<K, V> = TrieMap.TrieMap<K, V>;
  type List<A> = List.List<A>;
  type User = Types.user.canister.v1_0_1;
    
  var messages : List<Types.Message> = List.nil();
  var members : TrieMap<Text,User> = TrieMap.fromEntries(Iter.fromList(List.nil()), Text.equal, Text.hash);

  public func addMember(member : Member, memberRef: User): async () {
    Debug.print("[Chat][addMember]: " # member.name);
    await memberRef.addChat(state.name);

    let a = await memberRef.newSpecialFunction();
    members.put(member.name, memberRef);
  };

  public func sendMessage(message : Types.Message): async () {
      Debug.print("[Chat][sendMessage]: message.from: " # message.from.name);
      Debug.print("[Chat][sendMessage]: message.content: " # message.content);
      for (member in members.keys()) {
        if (message.from.name == member) {
          Debug.print("[Chat][sendMessage].b: Member is valid: " # member);
          messages := List.push(message, messages); //RBAC
          for (receiver in members.entries()) {
            if (message.from.name != receiver.0) {
              Debug.print("[Chat][sendMessage].b: Sending message to " # receiver.0);
              await receiver.1.receiveMessage(message);
            };
          };
        };
      };  
  };

  public shared query func getMessages() : async [Types.Message] {
    return List.toArray(messages);
  };
  public shared query func getMembers() : async [Text] { // TODO change return type to [MemberId]
    return Iter.toArray(members.keys());
  };


  public shared query func getVersion() : async ChatVersion {
    return #v1_0_1
  };

  public shared query func getState() : async State {
    return state;
  };

};
