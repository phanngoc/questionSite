var ItemTopic = React.createClass({
  getInitialState() {
      return {
        topics: this.props.topics
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

  removeTopic() {
    this.props.removeTopicFollow(this.props.topic);
  }

  render: function() {

    return (
      <li className="item-list-follow">
        <a href="javascript:" onClick={this.removeTopic}>
          <i className="fa fa-times" aria-hidden="true"></i>
        </a>
        <a className="icon">
          <img src={this.props.topic.icon} className="img_30" />
        </a>
      </li>
    );
  }

});
