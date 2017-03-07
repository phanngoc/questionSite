import { Injectable }              from '@angular/core';
import { Http, Response }          from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';
import { IUser } from '../models/user.model';

@Injectable()
export class UserService {
  private userUrl = 'http://localhost:3000/api/topics/1/users';

  constructor (private http: Http) {
  }
  getUsers (): Observable<any> {
    console.log("get users");
    return this.http.get(this.userUrl)
      .map(r => r.json());
  }

  private handleError (error: Response | any) {
    // In a real world app, we might use a remote logging infrastructure
    console.log("handleError", error);
    let errMsg: string;
    if (error instanceof Response) {
      const body = error.json() || '';
      const err = body.error || JSON.stringify(body);
      errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
    } else {
      errMsg = error.message ? error.message : error.toString();
    }
    console.error(errMsg);
    return Observable.throw(errMsg);
  }
}
