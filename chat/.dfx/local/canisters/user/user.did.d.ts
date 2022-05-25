import type { Principal } from '@dfinity/principal';
export interface Chat { 'name' : string }
export interface Member { 'name' : string }
export interface Message { 'content' : string, 'from' : Member }
export interface State { 'chats' : Array<Chat>, 'name' : string }
export interface User {
  'addChat' : (arg_0: Chat) => Promise<undefined>,
  'empty' : () => Promise<undefined>,
  'getChats' : () => Promise<Array<Chat>>,
  'getState' : () => Promise<State>,
  'getVersion' : () => Promise<string>,
  'receiveMessage' : (arg_0: Message) => Promise<undefined>,
}
export interface v1_0_0 { 'chats' : Array<Chat>, 'name' : string }
export interface _SERVICE extends User {}
