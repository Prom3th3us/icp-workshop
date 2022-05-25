import Types "../types/Types";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import user_1_0_0 "1.0.0";
import user_1_0_1  "1.0.1";


module versioning {
  
  public module state {
    public type v1_0_0 = Types.user.state.v1_0_0;
    public type v1_0_1 = Types.user.state.v1_0_1;
  };

  public module canister {
    public type v1_0_0 = Types.user.canister.v1_0_0;
    public type v1_0_1 = Types.user.canister.v1_0_1;
  };



   type Upgrade<A, B> = { upgrade: A -> B };

   let v1_0_1: Upgrade<state.v1_0_0, state.v1_0_1> = {
        upgrade = func (old: state.v1_0_0): state.v1_0_1 {
            return {
              name = old.name;
              chats = old.chats;
              special = "from v1_0_0!";
            };
        };
    };



  public func upgrade(con: canister.v1_0_0): async canister.v1_0_1 {
    let v1_0_0 = await con.getState();
    let cid = await user_1_0_1.User(v1_0_1.upgrade(v1_0_0));
    await con.empty();
    return cid;
  }

};
