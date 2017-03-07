"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require("@angular/core");
var rxjs_1 = require("rxjs");
var io = require("socket.io-client");
var SocketService = (function () {
    function SocketService() {
        this.host = "ws://localhost:3000/cable";
    }
    // Get items observable
    SocketService.prototype.get = function (name) {
        var _this = this;
        this.name = name;
        var socketUrl = this.host + "/" + this.name;
        this.socket = io.connect(socketUrl);
        this.socket.on("connect", function () { return _this.connect(); });
        this.socket.on("disconnect", function () { return _this.disconnect(); });
        this.socket.on("error", function (error) {
            console.log("ERROR: \"" + error + "\" (" + socketUrl + ")");
        });
        // Return observable which follows "create" and "remove" signals from socket stream
        return rxjs_1.Observable.create(function (observer) {
            _this.socket.on("create", function (item) { return observer.next({ action: "create", item: item }); });
            _this.socket.on("remove", function (item) { return observer.next({ action: "remove", item: item }); });
            return function () { return _this.socket.close(); };
        });
    };
    // Create signal
    SocketService.prototype.create = function (name) {
        this.socket.emit("create", name);
    };
    // Remove signal
    SocketService.prototype.remove = function (name) {
        this.socket.emit("remove", name);
    };
    // Handle connection opening
    SocketService.prototype.connect = function () {
        console.log("Connected to \"" + this.name + "\"");
        // Request initial list when connected
        this.socket.emit("list");
    };
    // Handle connection closing
    SocketService.prototype.disconnect = function () {
        console.log("Disconnected from \"" + this.name + "\"");
    };
    SocketService = __decorate([
        core_1.Injectable(), 
        __metadata('design:paramtypes', [])
    ], SocketService);
    return SocketService;
}());
exports.SocketService = SocketService;
//# sourceMappingURL=socket.service.js.map