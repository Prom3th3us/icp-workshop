import Types "../../types/Types";
import Array "mo:base/Array";
import TrieMap "mo:base/TrieMap";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
import types "types"

module State {
    public func Ops(s: types.State): types.StateOps {

        return object A {
            public func getState(): types.State { return s; };
            public func getVersion(): types.Version { return #v0_0_1; };
            
            public func setName(n: Text): Types.chat.state.v0_0_1 { return {name = n}; };
        };
    };
};