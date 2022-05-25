import Principal "mo:base/Principal";
import Buffer "mo:base/Buffer";

module Types {

    public type Chat = {
        name : Text;
    };

    public type Member = {
        name : Text;
    };

    public type Message = {
        from: Member;
        content : Text;
    };

    public module chat {
        public module state {
            public type v0_0_1 = {
                name: Text;
            };
            public type v1_0_0 = {
                name: Chat;
                messages: [Message];
                members: [Member];
            };
            public type v1_0_1 = {
                name: Chat;
                messages: [Message];
                members: [Member];
                special: Text;
            };
            public type versions = { 
                #v0_0_1: v0_0_1;  
                #v1_0_0: v1_0_0;  
                #v1_0_1: v1_0_1;
            };
        };

        public module canister {
            public type version = {
                #v0_0_1;
                #v1_0_0;
                #v1_0_1;
            };
            public type v0_0_1 = actor {
                getState: query () -> async chat.state.v1_0_1;
                getVersion: query () -> async version;
            };
            public type v1_0_0 = actor {
                addMember: (Text, user.canister.v1_0_0) -> async (); 
                getMembers: query () -> async [Principal];
                getMessages: query () -> async [Message];
                getState: query () -> async chat.state.v1_0_1;
                getVersion: query () -> async version;
            };
            public type v1_0_1 = actor {
                sendMessage: Message -> async ();
                addMember: (Member, user.canister.v1_0_1) -> async (); 
                getMembers: query () -> async [Text];
                getMessages: query () -> async [Message];
                getState: query () -> async chat.state.v1_0_1;
                getVersion: query () -> async version;
            };
            public type versions = { 
                #v0_0_1: v0_0_1;  
                #v1_0_0: v1_0_0;  
                #v1_0_1: v1_0_1;
            };
        };
    };

    public module user {
        
        public module state {
            public type v1_0_0 = {
                name: Text;
                chats: [Chat];
            };
            public type v1_0_1 = {
                name: Text;
                chats: [Chat];
                special: Text;
            };
            public type versions = { 
                #v1_0_0: v1_0_0;  
                #v1_0_1: v1_0_1;
            };
        };

        public module canister {
            public type v1_0_0 = actor {
                receiveMessage: Message -> async ();
                addChat: Chat -> async (); 
                getVersion: query () -> async Text;
                getChats: query () -> async [Chat];
                getState: query () -> async user.state.v1_0_0;
                empty: () -> async (); 
            };
            public type v1_0_1 = actor {
                receiveMessage: Message -> async ();
                addChat: Chat -> async (); 
                getVersion: query () -> async Text;
                getChats: query () -> async [Chat];
                getState: query () -> async user.state.v1_0_1;
                empty: () -> async (); 
                newSpecialFunction: () -> async (); 
            };
            public type versions = { 
                #v1_0_0: v1_0_0;  
                #v1_0_1: v1_0_1;
            };
        }

    };
    

    




}