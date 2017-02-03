var HomeListTopic = React.createClass({

	getInitialState() {
    console.log(this.props.topicsFollow, this.props.topics);
    // var topicsFollow = jQuery.parseJSON(this.props.topicsFollow);
    // var topics = jQuery.parseJSON(this.props.topics);
    //
    // console.log(topics, topicsFollow);

		return {
      topicsFollow: this.props.topicsFollow,
      topics: this.props.topics,
      text_action: "Edit",
      isShowSuggest: false,
		}
	},
	componentDidMount() {

	},

  removeTopicFollow(id) {

  },

  addTopicFollow(id) {

  },
	render: function() {
		var styleFrameSuggest = this.state.isShowSuggest ? {display: "block"} : {display: "none"};
    var text_action = this.state.isShowSuggest ?  : "Done" : "Edit";

    var rowTopicsFollow = [];
    this.state.topicsFollow.forEach(function(topic, key) {
        rowTopics.push(
          <ItemTopicFollow topic={topic} key={key} removeTopicFollow={self.removeTopicFollow}/>
        );
    });

    this.state.topics.forEach(function(topic, key) {
        rowTopics.push(
          <ItemTopic topic={topic} key={key} addTopicFollow={self.addTopicFollow}/>
        );
    });

		return (
      <div className="home-list-topic">
        <h3 className="title">
          <span className="title_with_link">Feed</span>
          <div className="hover-menu-chose" style={styleFrameSuggest}>
            <div className="hover-menu-content">
              <div className="selection_input_interaction">
                <input placeholder="Search topic to follow" name="search_input"/>
              </div>
              <div className="container_topic_suggests">
                <ul>
                  {rowTopicsFollow}
                </ul>
              </div>
            </div>
          </div>
          <div className="text-action">{this.state.text_action}</div>
        </h3>
        <div className="paged-list-topic">
          <ul>
            {rowTopicsFollow}
          </ul>
        </div>
      </div>
		);
	}
});
