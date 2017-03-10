import React from 'react'
import reactCSS from 'reactcss'

var ModalLoadMore = React.createClass({
  getInitialState() {
    return {
      users: this.props.users,
      question: this.props.question
		}
	},

  componentDidMount() {
    this.loadPeople();
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

  typeSearch(e) {
    var self = this;
    $.ajax({
      url: "/questions/" + this.state.question.id + "/searchs",
      method: "GET",
      dataType: "json",
      data: {q: e.target.value}
    }).done(function(result) {
      if (result.status == 1) {
        self.setState({users: result.data});
      }
    });
  },

  render() {
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
      rows.push(
        <div className={classItemuser} key={i}>
          <div className="ch-avatar">
            <img src={this.state.users[i].avatar.url} className="img_40" alt="" />
          </div>
          <div className="wr-info">
            <b className="name">{this.state.users[i].name}</b>
          </div>
          <div className="act">
            {actionComponent}
          </div>
        </div>
      );
    }

    return (
      <div id="modalLoadMore" className="modal fade" role="dialog">
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-header">
              <button type="button" className="close" data-dismiss="modal">&times;</button>
              <h4 className="modal-title">Request</h4>
            </div>
            <div className="modal-body">
              <div className="fr-search">
                <input type="text" name="search" onChange={this.typeSearch} />
              </div>
              <div className="content-search">
                {rows}
              </div>
            </div>
          </div>
        </div>
      </div>
		);
	}
});

export default ModalLoadMore;