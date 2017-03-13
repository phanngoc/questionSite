import React from 'react'
import reactCSS from 'reactcss'

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

    $('.slimscroll').slimscroll({
      height: '200px'
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
      var classNameNoti= classNames("item-noti", {is_read: !noti.is_read});
      console.log(classNameNoti);
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
