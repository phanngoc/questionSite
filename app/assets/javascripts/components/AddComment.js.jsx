var AddComment = React.createClass({
	getInitialState() {
		return {
			isShow: false
		}
	},
	componentDidMount() {
		var $formAdd = $(ReactDOM.findDOMNode(this.refs.formAddComment));
		var $btnAdd = $(ReactDOM.findDOMNode(this.refs.btnAdd));
		var $addComment = $(ReactDOM.findDOMNode(this.refs.addComment));
		var self = this;

		$addComment.click(function() {
			self.setState({isShow: true});
		});

		$formAdd.submit(function(e){
	        e.preventDefault();
	    });

	    $btnAdd.click(function() {
	    	var formdata = new FormData($formAdd[0]);

	    	$.ajax({
			    url: self.props.comments_path,
			    method: 'POST',
			    processData: false,
	            contentType: false,
			    data: formdata
			}).done(function(result) {

			  	self.props.addCommentToList(result.data);
			  	$formAdd.find('textarea[name="content"]').val("");
			});
	    });	
	},	
	render: function() {
		var style = this.state.isShow ? {display: "block"} : {display: "none"};
		return (
		  <div className="frame-add-comment">
		  	<a href="javascript:" className="act-add-comment" ref="addComment">add a comment</a>
		    <form action={this.props.comments_path} className="form-add-comment" method="post" ref="formAddComment" style={style}>
		      <table className="ta-add-comment ta-fix" cellPadding="0" cellSpacing="0" width="100%">
		      	<tbody>
		      		<tr>
			          <td>
			            <textarea className="form-control" name="content"></textarea>
			            <input type="hidden" value={this.props.targetable_type} name="targetable_type" />
			            <input type="hidden" value={this.props.targetable_id} name="targetable_id" />
			          </td>
			          <td>
			            <button type="submit" className="btn btn-primary btn-add" ref="btnAdd">Add comment</button>
			          </td>
			        </tr>	
		      	</tbody>	
		      </table>
		    </form>
		  </div>
		);
	}
});