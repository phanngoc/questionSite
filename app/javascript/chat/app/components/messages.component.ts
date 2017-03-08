import { Component, OnInit } from '@angular/core';
import {IMessage} from '../models/message.model';


@Component({
  selector: 'messages-topic',
  templateUrl: './messages.html',
})

export class MessageComponent  implements OnInit {

  private messages: IMessage[];

  constructor() {

  }
  ngOnInit(){

  }
}
