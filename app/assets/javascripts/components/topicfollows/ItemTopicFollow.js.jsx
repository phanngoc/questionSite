var ItemTopicFollow = React.createClass({
  getInitialState() {
      return {
        topic: this.props.topic,
        isShowRemove: this.props.isShowRemove
      };
  },

  componentDidMount() {
    $(this.refs.formEditComment).submit(function(e){
      e.preventDefault();
    })
  },

  componentWillReceiveProps(nextProps) {
    this.setState({topic: nextProps.topic});
  },

  handleSave(e) {
    var self = this;
    var formdata = new FormData(this.refs.formEditComment);

    $.ajax({
      url: '/topics/' + this.props.comment.id,
      method: 'POST',
      processData: false,
      contentType: false,
      data: formdata
    }).done(function(result) {
      if (result.status == 1) {
        $(self.refs.formEditComment).find('textarea[name="content"]').val("");
        self.setState({
                        styleFrEdit: {display: "none"},
                        styleFrShow: {display: "flex"}
                      });
      } else {

      }
    });
  },

  handleDelete(e) {
    var self = this;
    var r = confirm("Are you sure to want to delete ?");

    var fd = new FormData();
    fd.append( '_method', 'DELETE');

    if (r == true) {
      $.ajax({
        url: '/comments/' + this.props.comment.id,
        method: 'POST',
        processData: false,
        contentType: false,
        data: fd
      }).done(function(result) {
        if (result.status == 1) {
          self.props.removeComment(self.props.comment.id);
        }
      });
    }
  },

  removeTopic() {
    this.props.removeTopicFollow(this.props.topic);
  }

  render: function() {
    var classVoteUp = classNames({ hidden: this.state.isUpVote });
    var classDontVote = classNames({ hidden: !this.state.isUpVote });

    return (
      <li className="item-list-follow">
        <a href="javascript:" onClick={this.removeTopic}>
          <i className="fa fa-times" aria-hidden="true"></i>
        </a>
        <a>
          <span className="name-topic">{this.props.topic.name}</span>
        </a>
      </li>
    );
  }

});
