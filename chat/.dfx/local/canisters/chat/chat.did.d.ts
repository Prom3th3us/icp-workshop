import type { Principal } from '@dfinity/principal';
export interface Chat { 'name' : string }
export type ChatVersion = { 'v0_0_1' : null } |
  { 'v1_0_0' : null } |
  { 'v1_0_1' : null };
export interface Chat__1 {
  'addMember' : (arg_0: Member__1, arg_1: Principal) => Promise<undefined>,
  'getMembers' : () => Promise<Array<string>>,
  'getMessages' : () => Promise<Array<Message>>,
  'getState' : () => Promise<State>,
  'getVersion' : () => Promise<ChatVersion>,
}
export interface Member { 'name' : string }
export interface Member__1 { 'name' : string }
export interface Message { 'content' : string, 'from' : Member }
export interface State {
  'members' : Array<Member>,
  'messages' : Array<Message>,
  'name' : Chat,
}
export interface User {
  'addChat' : (arg_0: Chat) => Promise<undefined>,
  'empty' : () => Promise<undefined>,
  'getChats' : () => Promise<Array<Chat>>,
  'getState' : () => Promise<v1_0_0__1>,
  'getVersion' : () => Promise<string>,
  'receiveMessage' : (arg_0: Message) => Promise<undefined>,
}
export interface v1_0_0 {
  'members' : Array<Member>,
  'messages' : Array<Message>,
  'name' : Chat,
}
export interface v1_0_0__1 { 'chats' : Array<Chat>, 'name' : string }
export interface _SERVICE extends Chat__1 {}
