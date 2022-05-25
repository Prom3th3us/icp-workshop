import Types "../types/Types";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import chat_1_0_0 "1.0.0";
import chat_1_0_1 "1.0.1";


module versioning {
  
  public module state {
    public type v1_0_0 = Types.chat.state.v1_0_0;
    public type v1_0_1 = Types.chat.state.v1_0_1;
  };

  public module canister {
    public type v1_0_0 = Types.chat.canister.v1_0_0;
    public type v1_0_1 = Types.chat.canister.v1_0_1;
  };



   type Upgrade<A, B> = { upgrade: A -> B };

   let v1_0_1: Upgrade<state.v1_0_0, state.v1_0_1> = {
        upgrade = func (old: state.v1_0_0): state.v1_0_1 {
            return {
              name = old.name;
              members = old.members;
              messages = old.messages;
              special = "from v1_0_0!";
            };
        };
    };



  public func upgrade(con: canister.v1_0_0): async canister.v1_0_1 {
    let v1_0_0: state.v1_0_0 = await con.getState();
    let cid = await chat_1_0_1.Chat(v1_0_1.upgrade(v1_0_0));
    //await con.empty();
    return cid;
  }

};
