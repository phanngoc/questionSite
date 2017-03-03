import { Component, OnInit } from '@angular/core';
import { UserService } from './services/user.service';
import {IUser} from './models/user.model';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';


export class Hero {
  id: number;
  name: string;
}

@Component({
  selector: 'my-app',
  templateUrl: './template/app.html',
  styleUrls: ['./css/app.css'],
  providers: [UserService]
})

export class AppComponent  implements OnInit {

  userService: UserService;
  private users: any;

  constructor(userService: UserService) {
    this.userService = userService;
  }
  ngOnInit(){
    this.userService.getUsers();
    let subscription = this.userService.getUsers().subscribe(
      d => this.users = d
    );
  }
}
