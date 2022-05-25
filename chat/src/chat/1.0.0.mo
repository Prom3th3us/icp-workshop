import Types "../types/Types";
import Array "mo:base/Array";
import TrieMap "mo:base/TrieMap";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Text "mo:base/Text";

actor class Chat(
  initialState: Types.chat.state.v1_0_0
) {

  type State = Types.chat.state.v1_0_0;
  type Member = Types.Member;
  type ChatVersion = Types.chat.canister.version;
  stable var state: State = initialState;

  type TrieMap<K, V> = TrieMap.TrieMap<K, V>;
  type List<A> = List.List<A>;
  type User = Types.user.canister.v1_0_0;
    
  var messages : List<Types.Message> = List.nil();
  var members : TrieMap<Text,User> = TrieMap.fromEntries(Iter.fromList(List.nil()), Text.equal, Text.hash);

  public func addMember(member : Member, memberRef: User): async () {
    Debug.print("[Chat][addMember]: " # member.name);
    await memberRef.addChat(state.name);
    members.put(member.name, memberRef);
  };

  public shared query func getMessages() : async [Types.Message] {
    return List.toArray(messages);
  };
  public shared query func getMembers() : async [Text] { // TODO change return type to [MemberId]
    return Iter.toArray(members.keys());
  };


  public shared query func getVersion() : async ChatVersion {
    return #v1_0_0
  };

  public shared query func getState() : async State {
    return state;
  };

};
