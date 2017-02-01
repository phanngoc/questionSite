var WrapperListComment = React.createClass({

	getInitialState() {
		var dataJson = jQuery.parseJSON(this.props.data);
	    return {
	    	comments: dataJson.comments, 
	    	answer: dataJson
	    };
	},
	
	componentDidMount() {
		
	},	
	
	addCommentToList(data) {
		var commentCreated = jQuery.parseJSON(data);
		this.state.comments.push(commentCreated);
		this.forceUpdate();
	},
	
	componentWillReceiveProps(nextProps) {

	},

	removeComment(id) {
		var arr = _.without(this.state.comments, _.findWhere(this.state.comments, {
	      id: id
	    }));

	    this.setState({comments: arr});
	},

	render: function() {

		return (
		 	<div className="wrapper-comment-answer">
		 		<ListComment comments={this.state.comments} removeComment={this.removeComment} />
		 		<AddComment targetable_type='Answer' 
		 					targetable_id={this.state.answer.id} 
		 					comments_path={gon.comments_path}
		 					addCommentToList={this.addCommentToList}
		 				/>
		 	</div>
		);
	}
});