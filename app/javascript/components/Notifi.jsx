import React from 'react'
import reactCSS from 'reactcss'
import moment from 'moment'

var Notifi = React.createClass({
  getInitialState() {
    return {
      notifies: [],
      isExpand: false,
    }
  },

  componentDidMount() {
    var self = this;
    $.ajax({
      url: "notifies",
      method: "GET",
      dataType: "json",
    }).done(function(results){
      results = _.map(results, function(item){return jQuery.parseJSON(item)});
      self.setState({notifies: results});
    });

    this.setupSubscription();

    $('.slimscroll').slimscroll({
      height: '200px'
    });
  },

  setupSubscription(){
    var self = this;
    var actionCable = ActionCable.createConsumer('ws://localhost:3000/cable');
    actionCable.subscriptions.create("NotiChannel", {
      connected: function () {
        console.log("connect");
      },

      received: function (data) {
        var n = noty({
          text        : "You have new notification.",
          type        : "success",
          dismissQueue: true,
          layout      : "bottomRight",
          theme       : "relax",
          callback: {
            onShow: function() {},
            afterShow: function() {},
            onClose: function() {
              self.setState({isExpand: true});
            },
            afterClose: function() {},
            onCloseClick: function() {},
          },
        });
        var arrNoti = self.state.notifies;
        arrNoti.unshift(data.noti);
        self.setState({notifies: arrNoti});
      }
    });
  },

  removeComment(id) {
    this.props.removeComment(id);
  },

  onExpand() {
    this.setState({isExpand: !this.state.isExpand});
  },

  watchLink(noti) {
    var self = this;
    $.ajax({
      url: "notifies/" + noti.id,
      method: "POST",
      dataType: "json",
      data: {_method: "PUT"},
    }).done(function(result){
      if (result.status == "1") {
        var notifies = _.map(result.data, function(item){return jQuery.parseJSON(item)});
        self.setState({notifies: notifies});
        window.location.href = noti.url;
      }
    });
  },

  render() {
    const styles = reactCSS({
      'default': {
        expand: {
          display: "none"
        },
      },
      'isExpand': {
        expand: {
          display: "block"
        },
      }
    }, this.state);

    var rows = [];
    var self = this;
    this.state.notifies.forEach(function(noti, key) {
      var content = $("<textarea />").html(noti.content).text();
      content += "<time class='time'>" + moment.unix(noti.time).fromNow() + "</time>";
      var classNameNoti= classNames("item-noti", {is_read: !noti.is_read});
      rows.push(
        <li key={key} className={classNameNoti} onClick={self.watchLink.bind(self, noti)}>
          <a className="wr-link" dangerouslySetInnerHTML={{__html: content}}
            href="javascript:">
          </a>
        </li>
      );
    });

    return (
      <div className="wrap-noti">
        <div className="anchor-pointer" onClick={this.onExpand}>
          <span className="in-text">Notification</span>
        </div>
        <div className="list-noti" style={styles.expand}>
          <div className="header">

          </div>
          <div className="list-in slimscroll">
            <ul className="wr-list">
              {rows}
            </ul>
          </div>
        </div>
      </div>
    );
  }
});

export default Notifi;
