var ItemTopicFollow = React.createClass({
  getInitialState() {
    return {
      topic: this.props.topic,
      isShowRemove: this.props.isShowRemove
    };
  },

  componentDidMount() {
   
  },

  componentWillReceiveProps(nextProps) {
    this.setState({topic: nextProps.topic, isShowRemove: this.props.isShowRemove});
  },

  removeTopic() {
    var self = this;
    
    $.ajax({
      url: '/users/remove_follow_topic/' + this.props.topic.id,
      method: 'POST',
      processData: false,
      contentType: false,
    }).done(function(result) {
      if (result.status == 1) {
        self.props.removeTopicFollow(self.props.topic);
      }
    });
  },

  render() {
    var styleRemoveLink = this.props.isShowRemove ? {display: "block"} : {display: "none"};

    return (
      <li className="item-list-follow">
        <a href="javascript:" onClick={this.removeTopic} className="removeIcon" style={styleRemoveLink}>
          <i className="fa fa-times" aria-hidden="true"></i>
        </a>
        <a className="link-topic">
          <span className="name-topic">{this.props.topic.name}</span>
        </a>
      </li>
    );
  }

});
