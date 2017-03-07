import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule }   from '@angular/forms';
import { RouterModule }  from '@angular/router';
import { HttpModule, JsonpModule } from '@angular/http';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';

import { AppComponent }        from './app.component';
import {HeaderComponent} from './components/header.component'
import {MessageComponent} from './components/messages.component'

@NgModule({
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    JsonpModule,
    RouterModule.forRoot([
    ]),
    NgbModule.forRoot()
  ],
  providers: [
  ],
  declarations: [
    AppComponent,
    HeaderComponent,
    MessageComponent
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
