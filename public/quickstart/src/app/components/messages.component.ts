import { Component, OnInit } from '@angular/core';
import {IMessage} from '../models/message.model';
import { Ng2Cable, Broadcaster } from 'ng2-cable';

@Component({
  selector: 'messages-topic',
  templateUrl: 'template/messages.html',
  providers: [Ng2Cable, Broadcaster]
})

export class MessageComponent  implements OnInit {

  private messages: IMessage[];

  constructor() {

  }
  ngOnInit(){

  }
}
