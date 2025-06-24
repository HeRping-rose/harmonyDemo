







class UserinfoType {
  nickname: string = ''
  avatar: string = ''
  token: string = ''

  constructor(nickname: string, avatar: string, token: string) {
    this.nickname = nickname
    this.avatar = avatar
    this.token = token
  }

}

export const userinfoStorage = new LocalStorage(new UserinfoType('','',''))
