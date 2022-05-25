export const idlFactory = ({ IDL }) => {
  const Chat = IDL.Record({ 'name' : IDL.Text });
  const v1_0_0 = IDL.Record({ 'chats' : IDL.Vec(Chat), 'name' : IDL.Text });
  const State = IDL.Record({ 'chats' : IDL.Vec(Chat), 'name' : IDL.Text });
  const Member = IDL.Record({ 'name' : IDL.Text });
  const Message = IDL.Record({ 'content' : IDL.Text, 'from' : Member });
  const User = IDL.Service({
    'addChat' : IDL.Func([Chat], [], []),
    'empty' : IDL.Func([], [], []),
    'getChats' : IDL.Func([], [IDL.Vec(Chat)], ['query']),
    'getState' : IDL.Func([], [State], ['query']),
    'getVersion' : IDL.Func([], [IDL.Text], ['query']),
    'receiveMessage' : IDL.Func([Message], [], []),
  });
  return User;
};
export const init = ({ IDL }) => {
  const Chat = IDL.Record({ 'name' : IDL.Text });
  const v1_0_0 = IDL.Record({ 'chats' : IDL.Vec(Chat), 'name' : IDL.Text });
  return [v1_0_0];
};
