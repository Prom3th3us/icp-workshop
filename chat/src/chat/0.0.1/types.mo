import Types "../../types/Types";
import Array "mo:base/Array";
import TrieMap "mo:base/TrieMap";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Text "mo:base/Text";

module types {

  public type State = Types.chat.state.v0_0_1;
  public type Version = Types.chat.canister.version;

  public type StateOps = {
      getVersion(): Version;
      getState(): State;
      setName(name: Text): State;
  };
  
};

