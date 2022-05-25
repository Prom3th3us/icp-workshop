export const idlFactory = ({ IDL }) => {
  const Member = IDL.Record({ 'name' : IDL.Text });
  const Message = IDL.Record({ 'content' : IDL.Text, 'from' : Member });
  const Chat = IDL.Record({ 'name' : IDL.Text });
  const v1_0_0 = IDL.Record({
    'members' : IDL.Vec(Member),
    'messages' : IDL.Vec(Message),
    'name' : Chat,
  });
  const Member__1 = IDL.Record({ 'name' : IDL.Text });
  const v1_0_0__1 = IDL.Record({ 'chats' : IDL.Vec(Chat), 'name' : IDL.Text });
  const User = IDL.Service({
    'addChat' : IDL.Func([Chat], [], []),
    'empty' : IDL.Func([], [], []),
    'getChats' : IDL.Func([], [IDL.Vec(Chat)], ['query']),
    'getState' : IDL.Func([], [v1_0_0__1], ['query']),
    'getVersion' : IDL.Func([], [IDL.Text], ['query']),
    'receiveMessage' : IDL.Func([Message], [], []),
  });
  const State = IDL.Record({
    'members' : IDL.Vec(Member),
    'messages' : IDL.Vec(Message),
    'name' : Chat,
  });
  const ChatVersion = IDL.Variant({
    'v0_0_1' : IDL.Null,
    'v1_0_0' : IDL.Null,
    'v1_0_1' : IDL.Null,
  });
  const Chat__1 = IDL.Service({
    'addMember' : IDL.Func([Member__1, User], [], []),
    'getMembers' : IDL.Func([], [IDL.Vec(IDL.Text)], ['query']),
    'getMessages' : IDL.Func([], [IDL.Vec(Message)], ['query']),
    'getState' : IDL.Func([], [State], ['query']),
    'getVersion' : IDL.Func([], [ChatVersion], ['query']),
  });
  return Chat__1;
};
export const init = ({ IDL }) => {
  const Member = IDL.Record({ 'name' : IDL.Text });
  const Message = IDL.Record({ 'content' : IDL.Text, 'from' : Member });
  const Chat = IDL.Record({ 'name' : IDL.Text });
  const v1_0_0 = IDL.Record({
    'members' : IDL.Vec(Member),
    'messages' : IDL.Vec(Message),
    'name' : Chat,
  });
  return [v1_0_0];
};
