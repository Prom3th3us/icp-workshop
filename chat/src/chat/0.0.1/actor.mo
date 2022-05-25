import Types "../../types/Types";
import Array "mo:base/Array";
import TrieMap "mo:base/TrieMap";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
import types "types";
import StateOps "service";


actor class Chat(
  initialState: types.State
) {

  let state = state.StateOps(initialState);

  public shared query func getVersion() : async types.Version {
    return #v0_0_1;
  };
  public shared query func getState() : async types.State {
    return state.getState();
  };

};
