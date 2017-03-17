import React from 'react'
import reactCSS from 'reactcss'
import ModalLoadMore from './ModalLoadMore.jsx'

var WrapBoxRequest = React.createClass({
  getInitialState() {
    return {
      isRequest: false,
      shortPeople: [],
      question: this.props.question,
      users: []
    }
  },

  componentDidMount() {
    this.loadPeople();
    $(".expand-box").hide();
  },

  loadPeople() {
    var self = this;
    $.ajax({
      method: "GET",
      url: "/questions/" + this.state.question.id + "/requests"
    }).done(function(result){
      self.setState({users: result});
    })
  },

  onAddPeople(user) {
    var self = this;
    $.ajax({
      url: "/questions/" + this.state.question.id + "/requests/" + user.id,
      method: "POST",
      dataType: "json",
      data: {_method: "PUT"}
    }).done(function(result) {
      if (result.status == 1) {
        var index = _.findIndex(self.state.users, function(value) {
          return value.id == user.id;
        });
        self.state.users[index].isAdded = true;
        self.forceUpdate();
      }
    });
  },

  initFrameLoadmore() {
    $("#modalLoadMore").modal("show");
  },

  toggleRequestBoard() {
    $(".expand-box").slideToggle();
  },

  render() {
    var styles = reactCSS({
      'default': {
        boxExtend: {
          display: "none",
        },
      },
      'isRequest': {
        boxExtend: {
          display: "block"
        }
      }
    }, this.state);

    var rows = [];


    for (var i = 0; i < this.state.users.length; i++) {
      var actionComponent;
      let isAdded = false;
      if (_.isUndefined(this.state.users[i].isAdded) ||
        !this.state.users[i].isAdded) {
        actionComponent = (<a href="javascript:" className="act-link"
          onClick={this.onAddPeople.bind(this, this.state.users[i])} >
          <i className="fa fa-plus" aria-hidden="true"></i>
        </a>)
      } else {
        actionComponent = (<a href="javascript:" className="act-link">
          <i className="fa fa-check" aria-hidden="true"></i>
        </a>)
        isAdded = true;
      }

      var classItemuser = classNames("item-user", {isAdded: true });
      var href = "users/" + this.state.users[i].id;
      rows.push(
        <div className={classItemuser} key={i}>
          <div className="ch-avatar">
            <img src={this.state.users[i].avatar.url} className="img_40" alt="" />
          </div>
          <div className="wr-info">
            <b className="name">
              <a href={href}>{this.state.users[i].name}</a>
            </b>
          </div>
          <div className="act">
            {actionComponent}
          </div>
        </div>
      );
    }

    return (
      <div className="wr-box-request">
        <a className="target-expand btn btn-default"
          onClick={this.toggleRequestBoard}>Request</a>
        <div className="expand-box">
          <div className="header">Request Answers</div>
          <div className="box-list">
            <div className="in-box-list">
              {rows}
            </div>
          </div>
          <div className="fr-search-more">
            <a className="search-more"
              onClick={this.initFrameLoadmore}>
              Search more </a>
            <ModalLoadMore users={this.state.users} question={this.state.question} />
          </div>
        </div>
      </div>
    );
  }
});

export default WrapBoxRequest;
